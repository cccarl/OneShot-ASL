// pointer path by doesthisusername
// script by SunglassesEmoji & NERS

state("OneShot", "Steam 64-bit IGT"){
    int igtFrames : "oneshot.exe", 0x45E6D0, 0x10, 0x10, 0x1EC;
}

state("OneShot", "Standalone"){
    int igtFrames : "oneshot.exe", 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam 32-bit"){
    int igtFrames : "oneshot.exe", 0x23384C, 0x8, 0x1C, 0x1C8;
}

startup{
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
    settings.Add("use_igt", true, "Use IGT instead of the LiveSplit load remover");

    vars.tempFrames = TimeSpan.FromSeconds(0);
}

init{
    // fix for odd issue where livesplit seems to hook a wrong or broken oneshot process, init{} will be rerun
    if (modules.First().ModuleMemorySize < 0x200000) {
        print("ASL: Reloading script, wrong ModuleMemorySize detected");
        Thread.Sleep(50);
        throw new Exception();
    }

    if (timer.CurrentTimingMethod == TimingMethod.RealTime && settings["game_time_set"] && timer.CurrentPhase == TimerPhase.NotRunning) {
        var message = MessageBox.Show
        (
            "LiveSplit uses Game Time or a Load Remover for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | OneShot Load Remover", MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if (message == DialogResult.Yes) {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    switch (modules.First().ModuleMemorySize) {
        case 0x4AC000: version = "Steam 64-bit IGT"; break;
        case 0x271000: version = "Steam 32-bit";     break;
        case 0x275000: version = "Standalone";       break;
        default:       version = "Not Supported";    break;
    }
}

update{
    vars.gameTime = TimeSpan.FromSeconds(current.igtFrames / 60.0d) + vars.tempFrames;
}

start{
    if (current.igtFrames < old.igtFrames) {
        // avoid the timer starting when the game closes and the igt is 0 for a moment
        Thread.Sleep(50);
        return !game.HasExited;
    };
}

isLoading{
    if (!settings["use_igt"]) {
        if (timer.IsGameTimePaused && current.igtFrames != 0) {
            return false;
        }
    }

    else return true;
}

gameTime{
    
    // for the first 15s the timer is always set, once 15s have passed it will not jump back to much smaller values, this prevents livesplit from showing 0.xx when opening the game
    if (settings["use_igt"] && ((timer.CurrentTime.GameTime > TimeSpan.FromSeconds(14) && vars.gameTime > TimeSpan.FromSeconds(14)) || timer.CurrentTime.GameTime < TimeSpan.FromSeconds(15))) {
        return vars.gameTime;
    }
}

exit{
    timer.IsGameTimePaused = true;

    // find the file that indicates that the game has been beaten to save the current IGT and add it up to a new IGT in a new save file later (by NERS)
    if (settings["use_igt"] && vars.tempFrames == TimeSpan.FromSeconds(0)) {
        if (File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot")) {
            vars.tempFrames = timer.CurrentTime.GameTime;
        }
    }
}

onStart{
    vars.tempFrames = TimeSpan.FromSeconds(0);
}
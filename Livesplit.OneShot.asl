// pointer path by doesthisusername
// script by SunglassesEmoji

state("OneShot", "Steam 64-bit IGT"){
    int framesGameOpen : "oneshot.exe", 0x45E6D0, 0x10, 0x10, 0x1EC;
}

state("OneShot", "Standalone"){
    int framesGameOpen : "oneshot.exe", 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam 32-bit"){
    int framesGameOpen : "oneshot.exe", 0x23384C, 0x8, 0x1C, 0x1C8;
}

startup{
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
    settings.Add("use_igt", true, "Use IGT instead of the LiveSplit load remover");
}

init{
    
    // fix for odd issue where livesplit seems to hook a wrong or broken oneshot process, init{} will be rerun
    if (modules.First().ModuleMemorySize < 0x200000) {
        //print("ASL: Reloading script, wrong ModuleMemorySize detected");
        Thread.Sleep(50);
        throw new Exception();
    }

    if (timer.CurrentTimingMethod == TimingMethod.RealTime && settings["game_time_set"] && timer.CurrentPhase.ToString() == "NotRunning"){
        var message = MessageBox.Show(
            "LiveSplit uses Game Time or a Load Remover for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | OneShot Load Remover", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

        if (message == DialogResult.Yes){
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    switch (modules.First().ModuleMemorySize) {
        case 0x4AC000: version = "Steam 64-bit IGT"; break;
        case 0x271000: version = "Steam 32-bit"; break;
        case 0x275000: version = "Standalone"; break;
        default: version = "Not Suported"; break;
    }



}

update{
    // TODO: Figure out igt for multi-save runs
}

start{
    return current.framesGameOpen > 60 && current.framesGameOpen < 120;
}

isLoading{
    
    if (!settings["use_igt"]){
        if (timer.IsGameTimePaused && current.framesGameOpen != 0){
            return false;
        }
    }
    else {
        return true;
    }
}

gameTime{

    if (settings["use_igt"] && current.framesGameOpen > 60){
        return TimeSpan.FromSeconds(current.framesGameOpen  / 60.0d);
    }
    
}

exit{
    timer.IsGameTimePaused = true;
}

onStart{
    vars.igtBackup = 0;
}
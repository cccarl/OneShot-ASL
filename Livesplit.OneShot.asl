// pointer path by doesthisusername
// script by SunglassesEmoji

state("OneShot", "Standalone"){
    int framesGameOpen : "oneshot.exe", 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam 32-bit"){
    int framesGameOpen : "oneshot.exe", 0x23384C, 0x8, 0x1C, 0x1C8;
}

startup{
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
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
            "LiveSplit has a load remover for this game available when comparing against Game Time. Would you like to change the current timing method to Game Time instead of Real Time?", 
            "LiveSplit | OneShot Load Remover", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

        if (message == DialogResult.Yes){
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    switch (modules.First().ModuleMemorySize) {
        case 0x271000: version = "Steam 32-bit"; break;
        case 0x275000: version = "Standalone"; break;
        default: version = "Not Suported"; break;
    }

}

isLoading{
    if (timer.IsGameTimePaused && current.framesGameOpen != 0){
        return false;
    }
}

exit{
    timer.IsGameTimePaused = true;
}

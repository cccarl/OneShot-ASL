// pointer path by doesthisusername
// script by SunglassesEmoji

state("OneShot", "Standalone"){
    int framesGameOpen : "oneshot.exe", 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam"){
    int framesGameOpen : "oneshot.exe", 0x23384C, 0x8, 0x1C, 0x1C8;
}

startup{
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
}

init{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime && settings["game_time_set"] && timer.CurrentPhase.ToString() == "NotRunning"){
        var message = MessageBox.Show(
            "LiveSplit has a load remover for this game available when comparing against Game Time. Would you like to change the current timing method to Game Time instead of Real Time?", 
            "LiveSplit | OneShot Load Remover", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

        if (message == DialogResult.Yes){
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    // MD5 code by CptBrian.
    string MD5Hash;
    using (var md5 = System.Security.Cryptography.MD5.Create())
        using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            MD5Hash = md5.ComputeHash(s).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);

    switch (MD5Hash){
        case "9980F8856EA81CF5046DBA1B5437B8BD": version = "Standalone"; break;
        case "5379925D4B6750CD3036FF273C6BDFB4": version = "Steam"; break;
        default: version = "Not Supported"; break;
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
// pointer path by doesthisusername
// script by SunglassesEmoji

state("OneShot", "Standalone"){
    int framesGameOpen : 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam"){
    int framesGameOpen : 0x23384C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Unknown"){
    // unknown patches use sigscan
}

startup{
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");

    vars.pointerTarget = new SigScanTarget(2, 
        "8B 0D ?? ?? ?? ?? 57 C6 45 ?? 01 E8 ?? ?? ?? ?? 8B C8 E8 ?? ?? ?? ?? 8D 4F ?? C7 45 ?? 02 00 00 00 C7 07 ?? ?? ?? ?? FF D6 8B 75 ?? C6 45 ?? 03"
    );

    vars.igtPointerAddress = IntPtr.Zero;
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
        default: version = "Unknown"; break;
    }


    if (vars.igtPointerAddress == IntPtr.Zero && version == "Unknown"){

        foreach (var page in game.MemoryPages(true).Reverse()) {
            var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);

            vars.igtPointerAddress = scanner.Scan(vars.pointerTarget);
            if (vars.igtPointerAddress != IntPtr.Zero) {
                break;
            }
        }

        var igtPointer = (IntPtr)memory.ReadValue<int>((IntPtr)vars.igtPointerAddress);
        vars.framesGameOpen = new MemoryWatcher<int>(new DeepPointer(igtPointer, 0x8, 0x1C, 0x1C8));
        vars.watchers = new MemoryWatcherList() {vars.framesGameOpen};
    }
}

update{
    if (version == "Unknown"){
        vars.watchers.UpdateAll(game);
    }
}

isLoading{
    if (version != "Unknown"){
        if (timer.IsGameTimePaused && current.framesGameOpen != 0){
            return false;
        }
    }
    else{
        if (timer.IsGameTimePaused && vars.framesGameOpen.Current > vars.framesGameOpen.Old){
            return false;
        }
    }
}

exit{
    timer.IsGameTimePaused = true;
}
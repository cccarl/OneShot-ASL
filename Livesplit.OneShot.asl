// pointer path by doesthisusername & NERS
// script by SunglassesEmoji & NERS

state("OneShot", "Steam 64-bit IGT") {
    int igtFrames : "oneshot.exe", 0x45E6D0, 0x10, 0x10, 0x1EC;
    int room : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x58, 0x0, 0x8, 0x18, 0x0; // make sure to do "room >> 1" to get the accurate room id because rpg maker xp is the engine of all time

    byte playthroughType : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x4C0; // 0 - any%, 20 - ng+
    
    // any% pointers
    byte generatorState : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0xD8; // 0 - off, 20 - on
    byte alulaState : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x398, 0x0, 0x8, 0x10, 0x20, 0x60; // 0 - before puzzle, 5 - after puzzle but not in party, 9 - in party
    byte kipGaveCard : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x200; // 0 - no, 20 - yes
    byte finalChoicer : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x398, 0x0, 0x8, 0x10, 0x20, 0x378; // random ass value - no choice yet, 3 - return the sun, 5 - go home

    // ng+ pointers
    byte maizeState : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x7B8; // 0 - not talked to, 20 - talked to
    byte solsticeBeaten : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x500; // 0 - not beaten, 20 - beaten
}

state("OneShot", "Standalone (Autosplitting not supported)") {
    int igtFrames : "oneshot.exe", 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam 32-bit (Autosplitting not supported)") {
    int igtFrames : "oneshot.exe", 0x23384C, 0x8, 0x1C, 0x1C8;
}

startup {
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
    settings.Add("use_igt", true, "Use IGT instead of the LiveSplit load remover");
    settings.SetToolTip("use_igt", "Uncheck this if you're using a version of the game that doesn't have built-in IGT\nor if you just don't want to use it, for some reason.");

    //
    settings.Add("any%", true, "Any% Splits");
    settings.CurrentDefaultParent = "any%";

    settings.Add("exit_house_any%", true, "Exit House");
    settings.Add("generator", true, "Generator Powered On");
    settings.Add("exit_barrens", true, "Exit Barrens");
    settings.Add("alula", true, "Exit Alula's room");
    settings.Add("exit_glen_any%", true, "Exit Glen");
    settings.Add("enter_elevator_any%", true, "Enter Elevator");
    settings.Add("exit_factory", true, "Exit Factory (after getting Kip's card)");
    settings.Add("redXroom", true, "Red X Room (game close)");
    settings.Add("any%_end", false, "Ending (EXPERIMENTAL - currently splits when you hover over one of the choices)");

    settings.CurrentDefaultParent = null;

    settings.Add("start_ng+", false, "Split for starting NG+ in Solstice runs");

    settings.Add("ng+", true, "New Game+ Splits");
    settings.CurrentDefaultParent = "ng+";

    settings.Add("exit_house_ng+", true, "Exit House");
    settings.Add("deep_mines", true, "Enter Deep Mines");
    settings.Add("enter_glen", true, "Enter Glen");
    settings.Add("slab_cutscene", true, "Slab Cutscene");
    settings.Add("exit_maize", true, "Exit Maize's room");
    settings.Add("exit_glen_ng+", true, "Exit Glen");
    settings.Add("enter_elevator_ng+", true, "Enter Elevator with Plight");
    settings.Add("enter_study_room", true, "Enter Study Room");
    settings.Add("ng+_end", false, "Ending (EXPERIMENTAL - currently splits after Niko exits the game window)");
    //

    vars.tempFrames = TimeSpan.FromSeconds(0);
    vars.saveTimeOnStartup = false;
    vars.gameBeaten = false; // for saving tempFrames in the Steam 64-bit IGT version, a separate variable had to be added because pointers can't be used in exit{} and it's better than looking for the file on the hard drive
}

init {
    // fix for odd issue where livesplit seems to hook a wrong or broken oneshot process, init{} will be rerun
    if(modules.First().ModuleMemorySize < 0x200000) {
        print("ASL: Reloading script, wrong ModuleMemorySize detected");
        Thread.Sleep(50);
        throw new Exception();
    }

    if(timer.CurrentTimingMethod == TimingMethod.RealTime && settings["game_time_set"] && timer.CurrentPhase == TimerPhase.NotRunning) {
        var message = MessageBox.Show(
            "LiveSplit uses Game Time or a Load Remover for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | OneShot Load Remover", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

        if(message == DialogResult.Yes) {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    switch(modules.First().ModuleMemorySize) {
        case 0x4AC000:
            version = "Steam 64-bit IGT";

            vars.done = 0; // did the split get triggered already or not?
            vars.playthrough_type = 1; // is the split for any% or ng+?
            vars.oldroom = 2; // old room requirement
            vars.newroom = 3; // new room requirement

            vars.splits = new Dictionary<string, object[]>() {
                {"exit_house_any%", new object[] {false, 0, 4, 13}},
                {"generator", new object[] {false, 0, 16, 16}}, // the check for the generator's state is in split{}
                {"exit_barrens", new object[] {false, 0, 19, 27}},
                {"alula", new object[] {false, 0, 40, 38}}, // the check for alula's state is in split{}
                {"exit_glen_any%", new object[] {false, 0, 46, 47}},
                {"enter_elevator_any%", new object[] {false, 0, 48, 22}},
                {"exit_factory", new object[] {false, 0, 112, 104}}, // the check for having kip's card is in split{}
                {"redXroom", new object[] {false, 0, 97, 0}}, // had to make a separate check for this in split{} because otherwise it wouldn't work sometimes
                {"any%_end", new object[] {false, 0, 60, 60}}, // the check for the choicer is in split{}
            
                {"start_ng+", new object[] {false, 20, -1, -1}}, // had to put this here but the check for it is put separately in split{}

                {"exit_house_ng+", new object[] {false, 20, 4, 13}},
                {"deep_mines", new object[] {false, 20, 195, 102}},
                {"enter_glen", new object[] {false, 20, 197, 208}},
                {"slab_cutscene", new object[] {false, 20, 212, 67}},
                {"exit_maize", new object[] {false, 20, 203, 202}}, // the check for maize's state is in split{}
                {"exit_glen_ng+", new object[] {false, 20, 239, 213}},
                {"enter_elevator_ng+", new object[] {false, 20, 222, 228}},
                {"enter_study_room", new object[] {false, 20, 222, 249}},
                {"ng+_end", new object[] {false, 20, 255, 255}}
            };

            break;
        case 0x271000: version = "Steam 32-bit (Autosplitting not supported)"; break;
        case 0x275000: version = "Standalone (Autosplitting not supported)"; break;
        default: version = "Not Supported"; break;
    }

    // if the end game file is not there after it was there when closing the game, the tempFrames will not be reset
    // the Steam 64-bit IGT version has a pointer for the playthrough type so this is not needed in that case
    if(version != "Steam 64-bit IGT" && vars.saveTimeOnStartup) {
        // if the file still exists -> undo tempframes
        if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot")) {
            vars.tempFrames = TimeSpan.FromSeconds(0);
        }
        vars.saveTimeOnStartup = false;
    }
}

update {
    if(version == "Steam 64-bit IGT") {
        if(current.room != old.room) {
            print("ASL: Room changed [" + (old.room >> 1) + " -> " + (current.room >> 1) + "]");
        }

        if((current.finalChoicer == 3 || current.finalChoicer == 5) && vars.gameBeaten == false) {
            vars.gameBeaten = true;
        }
    }
    vars.gameTime = TimeSpan.FromSeconds(current.igtFrames / 60.0d) + vars.tempFrames;
}

start {
    if(current.igtFrames < old.igtFrames) {
        // avoid the timer starting when the game closes and the igt is 0 for a moment
        Thread.Sleep(50);
        return !game.HasExited;
    }
}

reset {
    if(current.igtFrames < old.igtFrames && vars.tempFrames == TimeSpan.FromSeconds(0)) {
        // avoid the timer resetting when the game closes and the igt is 0 for a moment
        Thread.Sleep(50);
        return !game.HasExited;
    }
}

isLoading {
    if(settings["use_igt"]) return true;
    else if(timer.IsGameTimePaused && current.igtFrames != 0) return false;
}

gameTime {
    // for the first 15s the timer is always set, once 15s have passed it will not jump back to much smaller values, this prevents livesplit from showing 0.xx when opening the game
    // also adds the temp frames for solstice runs
    if(settings["use_igt"] && ((timer.CurrentTime.GameTime > TimeSpan.FromSeconds(14) + vars.tempFrames && vars.gameTime > TimeSpan.FromSeconds(14) + vars.tempFrames) 
        || timer.CurrentTime.GameTime < TimeSpan.FromSeconds(15) + vars.tempFrames)) {
        return vars.gameTime;
    }
}

exit {
    timer.IsGameTimePaused = true;

    // find the file that indicates that the game has been beaten to save the current IGT and add it up to a new IGT in a new save file later (by NERS)
    // not needed for the Steam 64-bit IGT version as mentioned like 25 times already :bailey:
    if(vars.tempFrames == TimeSpan.FromSeconds(0)) {
        if(version != "Steam 64-bit IGT") {
            if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot")) {
                vars.saveTimeOnStartup = true;
                vars.tempFrames = timer.CurrentTime.GameTime;
            }
        }
        else if(vars.gameBeaten) {
            vars.tempFrames = timer.CurrentTime.GameTime;
        }
    }
}

onStart {
    vars.tempFrames = TimeSpan.FromSeconds(0);
    vars.gameBeaten = false;

    foreach(string split in vars.splits.Keys) vars.splits[split][vars.done] = false;
    print("ASL: All splits reset");
}

split {
    if(version == "Steam 64-bit IGT") {
        if(current.playthroughType == 0 && (current.room >> 1) == 97 && settings["redXroom"] && !vars.splits["redXroom"][vars.done]) {
            game.WaitForExit();
            vars.splits["redXroom"][vars.done] = true;
            return true;
        }

        if(current.playthroughType == 20 && settings["start_ng+"] && !vars.splits["start_ng+"][vars.done] && current.igtFrames < old.igtFrames) {
            Thread.Sleep(50);
            if(!game.HasExited) {
                vars.splits["start_ng+"][vars.done] = true;
                return true;
            }
        }

        foreach(string name in vars.splits.Keys) {
            if(settings[name] && !vars.splits[name][vars.done]) {
                // check for playthrough type
                if(current.playthroughType != vars.splits[name][vars.playthrough_type]) continue;
                // check for old room requirement
                if((old.room >> 1) != vars.splits[name][vars.oldroom]) continue;
                // check for new room requirement
                if((current.room >> 1) != vars.splits[name][vars.newroom]) continue;

                // separate check for the generator's state
                if(name == "generator" && current.generatorState != 20) continue;

                // separate check for alula's state
                if(name == "alula" && current.alulaState != 9) continue;

                // separate check for having kip's card
                if(name == "exit_factory" && current.kipGaveCard != 20) continue;

                // separate check for the final any% choicer
                if(name == "any%_end" && current.finalChoicer != 3 && current.finalChoicer != 5) continue;

                // separate check for maize's state
                if(name == "exit_maize" && current.maizeState != 20) continue;

                // separate check for ng+ ending
                if(name == "ng+_end" && current.solsticeBeaten != 20) continue;

                vars.splits[name][vars.done] = true;
                print("ASL: Split " + name + " triggered successfully");
                return true;
            }
        }
    }
}

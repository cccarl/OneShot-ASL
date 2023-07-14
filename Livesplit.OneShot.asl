/*
Pointer paths by doesthisusername & NERS
Script by SunglassesEmoji & NERS

Switches used:
14 - ramquest finished
27 - generator on
64 - kip gave card
76 - ate pancakes
79 - roomba
126-133 - trades
134 - reset ram puzzle once
135-141 - books
152 - Beat the game once
247 - maize made bridges

Variables used:
12 - alula state
*/

state("OneShot", "Steam 64-bit IGT") 
{
    int igtFrames    : "oneshot.exe",                  0x45E6D0, 0x10, 0x10,  0x1EC;
    int room         : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x58,  0x0,   0x8,  0x18, 0x0;    
    string32 choicer : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x2A8, 0x0,   0x8,  0x18, 0x38, 0x10, 0x10;
    string32 sound   : "oneshot.exe",                  0x45E6D0, 0x10, 0x48,  0x540, 0x80, 0x30, 0x38, 0x0,  0x0;

    int ramquest_finished     : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x70;
    int generator_on          : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0xD8;
    int kip_gave_card         : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x200;
    int ate_pancakes          : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x260;
    int roomba                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x278;
    int trade1                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x3F0;
    int trade2                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x3F8;
    int trade3                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x400;
    int trade4                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x408;
    int trade5                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x410;
    int trade6                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x418;
    int trade7                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x420;
    int trade8                : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x428;
    int reset_ram_puzzle_once : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x430;
    int book1                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x438;
    int book2                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x440;
    int book3                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x448;
    int book4                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x450;
    int book5                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x458;
    int book6                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x460;
    int book7                 : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x468;
    int beat_the_game_once    : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x4C0;
    int maize_made_bridges    : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x7B8;

    int alula_state : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x398, 0x0, 0x8, 0x10, 0x20, 0x60;
}

state("OneShot", "Standalone (Autosplitting not supported)") 
{
    int igtFrames : "oneshot.exe", 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam 32-bit (Autosplitting not supported)") 
{
    int igtFrames : "oneshot.exe", 0x23384C, 0x8, 0x1C, 0x1C8;
}

startup 
{
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
    settings.Add("use_igt", true, "Use IGT instead of the LiveSplit load remover");
    settings.SetToolTip("use_igt", "Uncheck this if you're using a version of the game that doesn't have built-in IGT\nor if you just don't want to use it.");

    settings.Add("any%", false, "Any% Splits");
    settings.CurrentDefaultParent = "any%";
    settings.Add("exit_house_any%",      true, "Exit House");
    settings.Add("generator",            true, "Generator Powered On");
    settings.Add("exit_barrens",         true, "Exit Barrens");
    settings.Add("alula",                true, "Exit Alula's room");
    settings.Add("exit_glen_any%",       true, "Exit Glen");
    settings.Add("enter_elevator_any%",  true, "Enter Elevator");
    settings.Add("exit_factory",         true, "Exit Factory (after getting Kip's card)");
    settings.Add("redXroom",             true, "Red X Room (game close)");
    settings.Add("any%_end",             true, "Ending");
    settings.CurrentDefaultParent = null;

    settings.Add("start_ng+", false, "Split for starting NG+ in Solstice runs");
    settings.Add("ng+", false, "New Game+ Splits");
    settings.CurrentDefaultParent = "ng+";
    settings.Add("exit_house_ng+",     true, "Exit House");
    settings.Add("deep_mines",         true, "Enter Deep Mines");
    settings.Add("enter_glen",         true, "Enter Glen");
    settings.Add("slab_cutscene",      true, "Slab Cutscene");
    settings.Add("exit_maize",         true, "Exit Maize's room");
    settings.Add("exit_glen_ng+",      true, "Exit Glen");
    settings.Add("enter_elevator_ng+", true, "Enter Elevator with Plight");
    settings.Add("enter_study_room",   true, "Enter Study Room");
    settings.Add("ng+_end",            true, "Ending");
    settings.CurrentDefaultParent = null;

    settings.Add("achievements", false, "Achievement Splits");
    settings.CurrentDefaultParent = "achievements";
    settings.Add("shock",             true, "Generator Shock");
    settings.Add("ram_whisperer",     true, "Ram Whisperer");
    settings.Add("extreme_bartering", true, "Extreme Bartering");
    settings.Add("we_ride_at_dawn",   true, "We Ride at Dawn");
    settings.Add("secret",            true, "Secret (ram room)");
    settings.Add("bookworm",          true, "Bookworm");
    settings.Add("pancakes",          true, "Pancakes");
    settings.Add("return",            true, "Return (game close)");

    vars.done             = 0; // did the split get triggered already or not?
    vars.playthrough_type = 1; // is the split for any% (0) or ng+ (20)?
    vars.oldroom          = 2; // old room requirement
    vars.newroom          = 3; // new room requirement
    vars.specialCondition = 4; // does this split need a separate check?
    vars.splits = new Dictionary<string, object[]>() 
    {
        {"exit_house_any%",     new object[] {false,  0,   4,  13,  0}},
        {"generator",           new object[] {false,  0,  -1,  16,  1}},
        {"exit_barrens",        new object[] {false,  0,  19,  27,  0}},
        {"alula",               new object[] {false,  0,  40,  38,  2}},
        {"exit_glen_any%",      new object[] {false,  0,  46,  47,  0}},
        {"enter_elevator_any%", new object[] {false,  0,  48,  22,  0}},
        {"exit_factory",        new object[] {false,  0, 112, 104,  3}},
        {"redXroom",            new object[] {false, -1,  -1,  -1, -1}}, // redXroom is handled in exit{} but i had to define it here to get rid of errors
        {"any%_end",            new object[] {false,  0,  -1,  60,  4}},  

        {"start_ng+",           new object[] {false, 20,  -1,   1, 5}},
        {"exit_house_ng+",      new object[] {false, 20,   4,  13, 0}},
        {"deep_mines",          new object[] {false, 20, 195, 102, 0}},
        {"enter_glen",          new object[] {false, 20,  -1, 208, 0}},
        {"slab_cutscene",       new object[] {false, 20, 212,  67, 0}},
        {"exit_maize",          new object[] {false, 20, 203, 202, 6}},
        {"exit_glen_ng+",       new object[] {false, 20, 239, 213, 0}},
        {"enter_elevator_ng+",  new object[] {false, 20, 222, 228, 0}},
        {"enter_study_room",    new object[] {false, 20, 222, 249, 0}},
        {"ng+_end",             new object[] {false, 20,  -1, 255, 7}},

        {"shock",               new object[] {false,  0, -1,  16,  8}},
        {"ram_whisperer",       new object[] {false,  0, -1,  29,  9}},
        {"extreme_bartering",   new object[] {false,  0, -1,  37, 10}},
        {"we_ride_at_dawn",     new object[] {false,  0, -1, 130, 11}},
        {"secret",              new object[] {false,  0, 91, 135,  0}},
        {"bookworm",            new object[] {false,  0, -1,  -1, 12}},
        {"pancakes",            new object[] {false,  0, -1,  53, 13}},
        {"return",              new object[] {false, -1, -1,  -1, -1}} // same thing as redXroom
    };

    vars.tempFrames = TimeSpan.FromSeconds(0);
    vars.saveTimeOnStartup = false;
    vars.gameBeaten = false; // for saving tempFrames in the Steam 64-bit IGT version & the Return achievement, a separate variable had to be added because pointers can't be used in exit{} and it's better than looking for the file on the hard drive
    vars.isInRedXRoom = false;
    vars.TimerModel = new TimerModel { CurrentState = timer };
}

init 
{
    // fix for odd issue where livesplit seems to hook a wrong or broken oneshot process, init{} will be rerun
    if(modules.First().ModuleMemorySize < 0x200000) 
    {
        print("[OneShot] Reloading script, wrong ModuleMemorySize detected");
        Thread.Sleep(50);
        throw new Exception();
    }

    if(timer.CurrentTimingMethod == TimingMethod.RealTime && settings["game_time_set"] && timer.CurrentPhase == TimerPhase.NotRunning) 
    {
        var message = MessageBox.Show
        (
            "LiveSplit uses a Load Remover for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | OneShot Load Remover", MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if(message == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }

    switch(modules.First().ModuleMemorySize) 
    {
        case 0x4AC000: version = "Steam 64-bit IGT";                           break;
        case 0x271000: version = "Steam 32-bit (Autosplitting not supported)"; break;
        case 0x275000: version = "Standalone (Autosplitting not supported)";   break;
        default:       version = "Not Supported";                              break;
    }

    // if the end game file is not there after it was there when closing the game, the tempFrames will not be reset
    // the Steam 64-bit IGT version has a pointer for the playthrough type so this is not needed in that case
    if(version != "Steam 64-bit IGT" && vars.saveTimeOnStartup)
    {
        // if the file still exists -> undo tempframes
        if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot"))
            vars.tempFrames = TimeSpan.FromSeconds(0);

        vars.saveTimeOnStartup = false;
    }
}

update 
{
    if(version == "Steam 64-bit IGT") 
    {
        current.room = (current.room >> 1);
        if(current.room != old.room) 
        {
            print("[OneShot] Room changed (" + old.room + " -> " + current.room + ")");
            if(current.room == 97 && current.beat_the_game_once == 0 && !vars.isInRedXRoom) vars.isInRedXRoom = true;
        }
        if(current.sound == @"Audio/SE/title_decision" && vars.gameBeaten == false && current.room == 60) vars.gameBeaten = true;
    }
    vars.gameTime = TimeSpan.FromSeconds(current.igtFrames / 60.0d) + vars.tempFrames;
}

start 
{
    return current.sound == @"Audio/SE/title_decision.wav" && current.room == 1 && current.igtFrames < old.igtFrames; // room 1 is the main menu; added the igt check because the same sound plays when you press Exit (and the timer shouldn't start when exiting the game lol)
}

reset 
{
    return old.sound != current.sound && current.sound == @"Audio/SE/title_decision.wav" && current.room == 1 && current.igtFrames < old.igtFrames && vars.tempFrames == TimeSpan.FromSeconds(0);
}

isLoading 
{
    if(settings["use_igt"]) return true;
    else if(timer.IsGameTimePaused && current.igtFrames != 0) return false;
}

gameTime 
{
    // for the first 15s the timer is always set, once 15s have passed it will not jump back to much smaller values, this prevents livesplit from showing 0.xx when opening the game
    // also adds the temp frames for solstice runs
    if(settings["use_igt"] && ((timer.CurrentTime.GameTime > TimeSpan.FromSeconds(14) + vars.tempFrames && vars.gameTime > TimeSpan.FromSeconds(14) + vars.tempFrames) || timer.CurrentTime.GameTime < TimeSpan.FromSeconds(15) + vars.tempFrames))
        return vars.gameTime;
}

exit 
{
    timer.IsGameTimePaused = true;

    // find the file that indicates that the game has been beaten to save the current IGT and add it up to a new IGT in a new save file later
    // not needed for the Steam 64-bit IGT version
    if(vars.tempFrames == TimeSpan.FromSeconds(0)) 
    {
        if(version != "Steam 64-bit IGT") 
        {
            if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot")) 
            {
                vars.saveTimeOnStartup = true;
                vars.tempFrames = timer.CurrentTime.GameTime;
            }
        }
        else if(vars.gameBeaten)
            vars.tempFrames = timer.CurrentTime.GameTime;
    }

    if(vars.isInRedXRoom && !vars.splits["redXroom"][vars.done] && settings["redXroom"]) 
    {
        vars.TimerModel.Split();
        vars.isInRedXRoom = false;
	vars.splits["redXroom"][vars.done] = true;
        print("[OneShot] Split redXroom triggered successfully");
    }
    if(vars.gameBeaten && !vars.splits["return"][vars.done] && settings["return"]) 
    {
        vars.TimerModel.Split();
        vars.splits["return"][vars.done] = true;
        print("[OneShot] Split return triggered successfully");    
    }
}

onStart 
{
    vars.tempFrames = TimeSpan.FromSeconds(0);
    vars.gameBeaten = false;
    vars.isInRedXRoom = false;

    if(game != null) 
    {
        foreach(string split in vars.splits.Keys) vars.splits[split][vars.done] = false;
        print("[OneShot] All splits reset");
    }
}

split 
{
    if(version == "Steam 64-bit IGT") 
    {
        foreach(string name in vars.splits.Keys) 
        {
            if(settings[name] && !vars.splits[name][vars.done]) 
            {
                if(current.beat_the_game_once != vars.splits[name][vars.playthrough_type]) continue;
                if(vars.splits[name][vars.oldroom] != -1 && old.room != vars.splits[name][vars.oldroom]) continue;
                if(vars.splits[name][vars.newroom] != -1 && current.room != vars.splits[name][vars.newroom]) continue;

                bool pass = true;
                int condition = vars.splits[name][vars.specialCondition];
                switch(condition) 
                {
                    case 1: // generator
                        pass = (current.generator_on == 20);
                        break;
                    case 2: // alula
                        pass = (current.alula_state == 9);
                        break;
                    case 3: // exit_factory
                        pass = (current.kip_gave_card == 20);
                        break;
                    case 4: // any%_end
                        pass = (current.sound == @"Audio/SE/title_decision");
                        break;

                    case 5: // start_ng+
                        pass = (current.sound == @"Audio/SE/title_decision.wav" && current.room == 1 && current.igtFrames < old.igtFrames && vars.gameBeaten == true);
                        break;
                    case 6: // exit_maize
                        pass = (current.maize_made_bridges == 20);
                        break;
                    case 7: // ng+_end
                        pass = (old.choicer == @"Goodbye, Niko." && current.choicer != @"Goodbye, Niko.");
                        break;

                    case 8: // shock
                        pass = (old.sound != null && current.sound == null);
                        break;
                    case 9: // ram_whisperer
                        pass = (current.ramquest_finished == 20 && (current.reset_ram_puzzle_once == 0 || current.reset_ram_puzzle_once == 8));
                        break;
                    case 10: // extreme_bartering
                        pass = (current.trade1 == 20 && current.trade2 == 20 && current.trade3 == 20 && current.trade4 == 20 && current.trade5 == 20 && current.trade6 == 20 && current.trade7 == 20 && current.trade8 == 20);
                        break;
                    case 11: // we_ride_at_dawn
                        pass = (old.roomba == 20 && current.roomba == 0);
                        break;
                    case 12: // bookworm
                        pass = (current.book1 == 20 && current.book2 == 20 && current.book3 == 20 && current.book4 == 20 && current.book5 == 20 && current.book6 == 20 && current.book7 == 20);
                        break;
                    case 13: // pancakes
                        pass = (current.ate_pancakes == 20);
                        break;
                }

                if(pass) 
                {
                    vars.splits[name][vars.done] = true;
                    print("[OneShot] Split " + name + " triggered successfully");
                    return true;
                }
            }
        }
    }
}

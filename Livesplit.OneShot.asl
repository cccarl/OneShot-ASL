/*
Pointer paths by doesthisusername & NERS
Script by SunglassesEmoji & NERS

Switches used:
(2014) 1 - hello?/result/temp
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
(2014) 1 - func
12 - alula state
(2014) 42 - alula state
*/

state("OneShot", "Steam 64-bit IGT") 
{
    int igtFrames  : 0x45E6D0, 0x10, 0x10, 0x1EC;
    int room       : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x58,  0x0, 0x8, 0x18, 0x0;   
    int eventID    : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x6B8, 0x0, 0x8, 0x18, 0x0, 0x18, 0x18;
    int eventLine  : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x6B8, 0x0, 0x8, 0x18, 0x0, 0x18, 0x60;
    string32 sound : 0x45E6D0, 0x10, 0x48, 0x40, 0x10, 0x448, 0x10, 0x0, 0x0;

    int ramquestFinished   : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x70;
    int generatorOn        : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0xD8;
    int kipGaveCard        : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x200;
    int atePancakes        : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x260;
    int roomba             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x278;
    int trade1             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x3F0;
    int trade2             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x3F8;
    int trade3             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x400;
    int trade4             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x408;
    int trade5             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x410;
    int trade6             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x418;
    int trade7             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x420;
    int trade8             : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x428;
    int resetRamPuzzleOnce : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x430;
    int book1              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x438;
    int book2              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x440;
    int book3              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x448;
    int book4              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x450;
    int book5              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x458;
    int book6              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x460;
    int book7              : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x468;
    int beatTheGameOnce    : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x4C0;
    int maizeMadeBridges   : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x228, 0x0, 0x8, 0x10, 0x20, 0x7B8;

    int alulaState : "x64-vcruntime140-ruby250.dll", 0x20B0C0, 0x10, 0x398, 0x0, 0x8, 0x10, 0x20, 0x60;
}

state("OneShot", "Standalone (Autosplitting not supported)") 
{
    int igtFrames : 0x236D4C, 0x8, 0x1C, 0x1C8;
}

state("OneShot", "Steam 32-bit (Autosplitting not supported)") 
{
    int igtFrames : 0x23384C, 0x8, 0x1C, 0x1C8;
}

state("RPG_RT", "v1.03 (2014)")
{
    int room : 0xD1F70, 0x4;

    bool helloTemp : 0xD1FF8, 0x20, 0x0;

    int func       : 0xD1FF8, 0x28, 0x0;
    int alulaState : 0xD1FF8, 0x28, 0xA4;
}

startup 
{
    settings.Add("2016", true, "2016 Version");
    settings.CurrentDefaultParent = "2016";
    settings.Add("game_time_set", true, "Ask if Game Time should be used when opening the game");
    settings.SetToolTip("game_time_set", "This won't be asked if Game Time is already being used or if the timer is running.");
    settings.Add("use_igt", true, "Use IGT instead of the LiveSplit load remover");
    settings.SetToolTip("use_igt", "Uncheck this if you're using a version of the game that doesn't have built-in IGT\nor if you just don't want to use it.");

    settings.Add("any%", false, "Any% Splits");
    settings.CurrentDefaultParent = "any%";
    settings.Add("exit_house_any%",     true, "Exit House");
    settings.Add("generator",           true, "Generator Powered On");
    settings.Add("exit_barrens",        true, "Exit Barrens");
    settings.Add("alula",               true, "Exit Alula's room");
    settings.Add("exit_glen_any%",      true, "Exit Glen");
    settings.Add("enter_elevator_any%", true, "Enter Elevator");
    settings.Add("exit_factory",        true, "Exit Factory (after getting Kip's card)");
    settings.Add("redXroom",            true, "Red X Room (game close)");
    settings.Add("any%_end",            true, "Ending");
    settings.CurrentDefaultParent = "2016";

    settings.Add("start_ng+", false, "Split for starting NG+ in Solstice runs");
    settings.Add("ng+", false, "New Game+ Splits");
    settings.CurrentDefaultParent = "ng+";
    settings.Add("exit_house_ng+",      true, "Exit House");
    settings.Add("deep_mines",          true, "Enter Deep Mines");
    settings.Add("enter_glen",          true, "Enter Glen");
    settings.Add("slab_cutscene",       true, "Slab Cutscene");
    settings.Add("exit_maize",          true, "Exit Maize's room");
    settings.Add("exit_glen_ng+",       true, "Exit Glen");
    settings.Add("enter_elevator_ng+",  true, "Enter Elevator with Plight");
    settings.Add("enter_study_room",    true, "Enter Study Room");
    settings.Add("enter_credits_room", false, "Enter Credits Room");
    settings.Add("ng+_end",             true, "Ending");
    settings.CurrentDefaultParent = "2016";

    settings.Add("achievements", false, "Achievement Splits");
    settings.CurrentDefaultParent = "achievements";
    settings.Add("shock",             false, "Generator Shock");
    settings.Add("ram_whisperer",     false, "Ram Whisperer");
    settings.Add("extreme_bartering", false, "Extreme Bartering");
    settings.Add("we_ride_at_dawn",   false, "We Ride at Dawn");
    settings.Add("secret",             true, "Secret (ram room)");
    settings.Add("bookworm",          false, "Bookworm");
    settings.Add("pancakes",          false, "Pancakes");
    settings.Add("return",             true, "Return (game close)");
    settings.CurrentDefaultParent = null;

    settings.Add("2014", false, "2014 Version");
    settings.CurrentDefaultParent = "2014";
    settings.Add("2014_exit_house",   true, "Exit House");
    settings.Add("2014_exit_barrens", true, "Exit Barrens");
    settings.Add("2014_alula",        true, "Exit Alula's room");
    settings.Add("2014_exit_glen",    true, "Exit Glen");
    settings.Add("2014_enter_tower",  true, "Enter Tower");
    settings.Add("2014_end",          true, "Ending");

    vars.tempFrames = TimeSpan.FromSeconds(0);
    vars.saveTimeOnStartup = false;
    vars.gameBeaten = false;
    vars.returnACHV = false;
    vars.isInRedXRoom = false;
    vars.completedSplits = new HashSet<string>();
    vars.timerModel = new TimerModel { CurrentState = timer };
}

init 
{
    // fix for odd issue where livesplit seems to hook a wrong or broken oneshot process, init{} will be rerun
    if(modules.First().ModuleMemorySize < 0x99999) 
    {
        print("[OneShot] Reloading script, wrong ModuleMemorySize detected");
        Thread.Sleep(50);
        throw new Exception();
    }

    switch(modules.First().ModuleMemorySize) 
    {
        case 0x4AC000:
            version = "Steam 64-bit IGT";

            vars.splits = new Dictionary<string, Func<dynamic, dynamic, bool>>()
            {
                // org = original (equivalent to old), cur = current (can't use the same names)
                // redXroom and return are manually handled in exit{} since we want those to happen when the game CLOSES, and split{} doesn't run if the game isn't open
                {"exit_house_any%",     (org, cur) => cur.beatTheGameOnce == 0 && org.room == 4 && cur.room == 13},
                {"generator",           (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 16 && org.generatorOn != 20 && cur.generatorOn == 20},
                {"exit_barrens",        (org, cur) => cur.beatTheGameOnce == 0 && org.room == 19 && cur.room == 27},
                {"alula",               (org, cur) => cur.beatTheGameOnce == 0 && org.room == 40 && cur.room == 38 && cur.alulaState == 9},
                {"exit_glen_any%",      (org, cur) => cur.beatTheGameOnce == 0 && org.room == 46 && cur.room == 47},
                {"enter_elevator_any%", (org, cur) => cur.beatTheGameOnce == 0 && org.room == 48 && cur.room == 22},
                {"exit_factory",        (org, cur) => cur.beatTheGameOnce == 0 && org.room == 112 && cur.room == 104 && cur.kipGaveCard == 20},
                {"any%_end",            (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 60 && cur.eventID == 12 && org.eventLine < 58 && cur.eventLine >= 58 && cur.eventLine < 220},  

                {"start_ng+",          (org, cur) => cur.beatTheGameOnce == 20 && cur.room == 1 && cur.sound == @"Audio/SE/title_decision.wav" && cur.igtFrames < org.igtFrames && vars.gameBeaten},
                {"exit_house_ng+",     (org, cur) => cur.beatTheGameOnce == 20 && org.room == 4 && cur.room == 13},
                {"deep_mines",         (org, cur) => cur.beatTheGameOnce == 20 && org.room == 195 && cur.room == 102},
                {"enter_glen",         (org, cur) => cur.beatTheGameOnce == 20 && org.room != 208 && cur.room == 208},
                {"slab_cutscene",      (org, cur) => cur.beatTheGameOnce == 20 && org.room == 212 && cur.room == 67},
                {"exit_maize",         (org, cur) => cur.beatTheGameOnce == 20 && org.room == 203 && cur.room == 202 && cur.maizeMadeBridges == 20},
                {"exit_glen_ng+",      (org, cur) => cur.beatTheGameOnce == 20 && org.room == 239 && cur.room == 213},
                {"enter_elevator_ng+", (org, cur) => cur.beatTheGameOnce == 20 && org.room == 222 && cur.room == 228},
                {"enter_study_room",   (org, cur) => cur.beatTheGameOnce == 20 && org.room == 222 && cur.room == 249},
                {"enter_credits_room", (org, cur) => cur.beatTheGameOnce == 20 && org.room == 259 && cur.room == 243},
                {"ng+_end",            (org, cur) => cur.beatTheGameOnce == 20 && cur.room == 255 && cur.eventID == 3 && org.eventLine < 153 && cur.eventLine >= 153},

                {"shock",             (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 16 && org.sound != null && cur.sound == null},
                {"ram_whisperer",     (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 29 && org.ramquestFinished != 20 && cur.ramquestFinished == 20 && cur.resetRamPuzzleOnce != 20},
                {"extreme_bartering", (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 37 && cur.trade1 == 20 && cur.trade2 == 20 && cur.trade3 == 20 && cur.trade4 == 20 && cur.trade5 == 20 && cur.trade6 == 20 && cur.trade7 == 20 && cur.trade8 == 20},
                {"we_ride_at_dawn",   (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 130 && org.roomba == 20 && cur.roomba == 0},
                {"secret",            (org, cur) => cur.beatTheGameOnce == 0 && org.room == 91 && cur.room == 135},
                {"bookworm",          (org, cur) => cur.beatTheGameOnce == 0 && cur.book1 == 20 && cur.book2 == 20 && cur.book3 == 20 && cur.book4 == 20 && cur.book5 == 20 && cur.book6 == 20 && cur.book7 == 20},
                {"pancakes",          (org, cur) => cur.beatTheGameOnce == 0 && cur.room == 53 && org.atePancakes != 20 && cur.atePancakes == 20}
            };
            break;
        
        case 0xF1000:
            version = "v1.03 (2014)";

            vars.splits = new Dictionary<string, Func<dynamic, dynamic, bool>>()
            {
                {"2014_exit_house",   (org, cur) => org.room == 5 && cur.room == 13},
                {"2014_exit_barrens", (org, cur) => org.room == 18 && cur.room == 24},
                {"2014_alula",        (org, cur) => org.room == 28 && cur.room == 30 && cur.alulaState == 4},
                {"2014_exit_glen",    (org, cur) => org.room == 46 && cur.room == 35},
                {"2014_enter_tower",  (org, cur) => org.room == 50 && cur.room == 66},
                {"2014_end",          (org, cur) => cur.room == 60 && org.func != 12 && cur.func == 12}
            };
            break;
        
        case 0x271000: version = "Steam 32-bit (Autosplitting not supported)"; break;
        case 0x275000: version = "Standalone (Autosplitting not supported)";   break;
        default:       version = "Not Supported";                              break;
    }

    if(timer.CurrentTimingMethod == TimingMethod.RealTime && settings["game_time_set"] && timer.CurrentPhase == TimerPhase.NotRunning && game.ProcessName != "RPG_RT")
    {
        var message = MessageBox.Show
        (
            "LiveSplit uses a Load Remover for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | OneShot", MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if(message == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }

    // if the end game file is not there after it was there when closing the game, the tempFrames will not be reset
    if(vars.saveTimeOnStartup)
    {
        // if the file still exists, undo tempFrames
        if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot"))
            vars.tempFrames = TimeSpan.FromSeconds(0);

        vars.saveTimeOnStartup = false;
    }
}

update 
{
    if(version == "Not Supported")
        return false;

    if(version != "v1.03 (2014)")
    {
        if(version == "Steam 64-bit IGT") 
        {
            current.room = (current.room >> 1);
            current.eventID = (current.eventID >> 1);
            current.eventLine = (current.eventLine >> 1);

            if(current.room != old.room) 
            {
                if(current.room == 97 && current.beatTheGameOnce == 0 && vars.isInRedXRoom == false) 
                    vars.isInRedXRoom = true;
                
                print("[OneShot 2016] Room changed (" + old.room + " -> " + current.room + ")");
            }

            if(current.room == 60 && current.eventID == 12)
            {
                if(current.eventLine > 57 && current.eventLine < 220 && vars.gameBeaten == false) 
                    vars.gameBeaten = true;

                // ending event (sun)
                else if(current.eventLine > 170 && current.eventLine < 180 && vars.returnACHV == false) 
                    vars.returnACHV = true;

                else if(current.eventLine > 189 && current.eventLine < 196 && vars.saveTimeOnStartup == false) // after the file is deleted the game jumps to these lines
                    vars.saveTimeOnStartup = true;
            }

            else if(current.room == 61 && current.eventID == 3) 
            {
                // ending event (home)
                if(current.eventLine > 110 && current.eventLine < 113 && vars.returnACHV == false) 
                    vars.returnACHV = true;

                else if(current.eventLine > 124 && current.eventLine < 814 && vars.saveTimeOnStartup == false)
                    vars.saveTimeOnStartup = true;                
            }
        }
        vars.gameTime = TimeSpan.FromSeconds(current.igtFrames / 60.0d) + vars.tempFrames;
    }
    else if(current.room != old.room) 
        print("[OneShot 2014] Room changed (" + old.room + " -> " + current.room + ")");
}

start 
{
    if(version == "Steam 64-bit IGT") 
        return (current.sound == @"Audio/SE/title_decision.wav" && current.room == 1 && current.igtFrames < old.igtFrames); 
        // room 1 is the main menu; added the igt check because the same sound plays when you press Exit

    else if(version == "v1.03 (2014)")
        return (!old.helloTemp && current.helloTemp && current.room == 2);
}

reset 
{
    if(version == "Steam 64-bit IGT") 
        return (old.sound != current.sound && current.sound == @"Audio/SE/title_decision.wav" && current.room == 1 && current.igtFrames < old.igtFrames && vars.tempFrames == TimeSpan.FromSeconds(0));

    else if(version == "v1.03 (2014)")
        return (!old.helloTemp && current.helloTemp && current.room == 2);
}

isLoading 
{
    if(version != "v1.03 (2014)")
    {
        if(settings["use_igt"]) return true;
        else if(timer.IsGameTimePaused && current.igtFrames != 0) return false;
    }
}

gameTime 
{
    if(version != "v1.03 (2014)")
    {
        // for the first 15s the timer is always set, once 15s have passed it will not jump back to much smaller values, this prevents livesplit from showing 0.xx when opening the game
        // also adds the temp frames for solstice runs
        if(settings["use_igt"] && ((timer.CurrentTime.GameTime > TimeSpan.FromSeconds(14) + vars.tempFrames && vars.gameTime > TimeSpan.FromSeconds(14) + vars.tempFrames) || timer.CurrentTime.GameTime < TimeSpan.FromSeconds(15) + vars.tempFrames))
            return vars.gameTime;
    }
}

exit 
{
    if(version != "v1.03 (2014)")
    {
        timer.IsGameTimePaused = true;

        if(vars.tempFrames == TimeSpan.FromSeconds(0)) 
        {
            if(version != "Steam 64-bit IGT")
            {
                // find the file that indicates that the game has been beaten to save the current IGT and add it up to a new IGT in a new save file later
                if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\My Games\Oneshot\save_progress.oneshot")) 
                {
                    vars.saveTimeOnStartup = true;
                    vars.tempFrames = timer.CurrentTime.GameTime;
                }
            }

            else if(vars.saveTimeOnStartup)
            {
                vars.saveTimeOnStartup = false;
                vars.tempFrames = timer.CurrentTime.GameTime;
            }
        }

        if(vars.isInRedXRoom && settings["redXroom"] && !vars.completedSplits.Contains("redXroom")) 
        {
            vars.timerModel.Split();
            vars.isInRedXRoom = false;
            vars.completedSplits.Add("redXroom");
            print("[OneShot] Split triggered (redXroom)");
        }

        if(vars.returnACHV && settings["return"] && !vars.completedSplits.Contains("return")) 
        {
            vars.timerModel.Split();
            vars.returnACHV = false;
            vars.completedSplits.Add("return");
            print("[OneShot] Split triggered (return)");    
        }
    }
}

onStart 
{
    vars.tempFrames = TimeSpan.FromSeconds(0);
    vars.gameBeaten = false;
    vars.returnACHV = false;
    vars.isInRedXRoom = false;
}

onReset
{
    vars.completedSplits.Clear();
    print("[OneShot] All splits have been reset to initial state");
}

split
{
    foreach(var split in vars.splits)
    {
        if(!settings[split.Key] || 
           vars.completedSplits.Contains(split.Key) ||
           !split.Value(old, current)) continue;

        vars.completedSplits.Add(split.Key);
        print("[OneShot] Split triggered (" + split.Key + ")");
        return true;
    }
}


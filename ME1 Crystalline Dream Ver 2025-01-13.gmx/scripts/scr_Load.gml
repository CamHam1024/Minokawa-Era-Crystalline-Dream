//Load Stuff
ini_open("Settings.ini")
//Options
global.VolSFX = ini_read_real("Options", "SFXVol", global.DefaultBGM)
global.VolPlSFX = ini_read_real("Options", "PlayerSFX", global.DefaultPlSFX)
global.VolBGM = ini_read_real("Options", "BGMVol", global.DefaultSFX)
global.Language = ini_read_real("Options", "Language", global.DefaultLanguage)

//Scenarios Completed
global.ExtraUnlocked = ini_read_string("Unlocks", "Extra", false)
global.MidnightScenario = ini_read_string("Scenarios", "Midnight", false)
global.AlexandraScenario = ini_read_string("Scenarios", "Alexandra", false)
global.ExtraScenario = ini_read_string("Scenarios", "Extra", false)

//OST Unlocked

ds_grid_read(global.Scoreboard[0], ini_read_string("Diary", "EScoreboard", ""))
ds_grid_read(global.Scoreboard[1], ini_read_string("Diary", "NScoreboard", ""))
ds_grid_read(global.Scoreboard[2], ini_read_string("Diary", "HScoreboard", ""))
ds_grid_read(global.Scoreboard[3], ini_read_string("Diary", "FScoreboard", ""))

ds_grid_read(global.OstUnlocked, ini_read_string("Diary", "MusicRecords", ""))

ini_close()


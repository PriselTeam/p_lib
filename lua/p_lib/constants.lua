PLib.Constants = PLib.Constants or {}

PLib.Constants.Version = "1.0.0"

PLib.Constants.Colors = {
    ["background"] = Color(44, 47, 54),
    ["blue"] = Color(41, 154, 216),
    ["hoverBlue"] = Color(58, 88, 119),
    ["red"] = Color(197, 42, 37),
    ["green"] = Color(37, 197, 37),
    ["orange"] = Color(197,152,37)
}

PLib.Constants.SGroups = {
    ["superadmin"] = true,
    ["resp"] = true,
    ["supconf"] = true,
    ["sup"] = true,
    ["modconf"] = true,
    ["mod"] = true,
    ["modjun"] = true
}

PLib.Constants.HGroups = {
    ["superadmin"] = true,
    ["resp"] = true
}

PLib.Constants.VGroups = {
    ["vip"] = true
}



// Merge staff groups to vip groups to avoid repeatition
table.Merge(PLib.Constants.VGroups, PLib.Constants.SGroups)
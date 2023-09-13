#include <sourcemod>
#include <sdktools>

#pragma semicolon 1

public Plugin myinfo = {
    name        = "Slap Player",
    author      = "safetyblades",
    description = "Use the command '<sm_slap> <damage>' to slap someone with/without damage on the server at anytime",
    version     = "1.0",
    url         = "https://steamcommunity.com/id/safetyblades"
};

public void OnPluginStart()
{
    RegAdminCmd("sm_slap", commandSlap, ADMFLAG_ROOT);
}

public Action commandSlap(int client, int args)
{
    char arg1[32], arg2[32];
    
    int damage = 0;
    
    GetCmdArg(1, arg1, sizeof(arg1));
    
    if (args >= 2)
    {
        GetCmdArg(2, arg2, sizeof(arg2));
        damage = StringToInt(arg2);
    }
    
    if (args > 2)
    {
        ReplyToCommand(client, "Usage : sm_slap <name:#userid> <damage>");
        return Plugin_Handled;
    }
    
    int target = FindTarget(client, arg1);
    if (target == -1)
    {
        return Plugin_Handled;
    }
    
    SlapPlayer(target, damage);
    ReplyToCommand(client, "You slapped %N for %d damage", target, damage);
    
    return Plugin_Handled;
}
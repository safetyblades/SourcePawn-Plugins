#include <sourcemod>
#include <cstrike>

#pragma semicolon 1

public Plugin myinfo = {
    name        = "Revive Player",
    author      = "safetyblades",
    description = "Use the command <sm_revive> to revive someone on the server at anytime",
    version     = "1.0",
    url         = "https://steamcommunity.com/id/safetyblades"
};

public void OnPluginStart()
{
    RegAdminCmd("sm_revive", commandRevive, ADMFLAG_ROOT);
}

public Action commandRevive(int client, int args)
{
    char arg1[32];
    GetCmdArg(1, arg1, sizeof(arg1));
    
    if (args > 1)
    {
        ReplyToCommand(client, "Usage: sm_revive <name/#userid>");
        return Plugin_Handled;
    }
    
    int target = FindTarget(client, arg1);
    if (target == -1)
    {
        return Plugin_Handled;
    }
    
    CS_RespawnPlayer(target);
    ReplyToCommand(client, "You revived %N!", target);
    
    return Plugin_Handled;
}
#include <sourcemod>
#include <cstrike>

#pragma semicolon 1

public Plugin myinfo = {
    name        = "Join Spectator Command",
    author      = "safetyblades",
    description = "Allows the player to join spectator mode with the command '<sm_joinspec>'",
    version     = "1.0",
    url         = "https://steamcommunity.com/id/safetyblades"
};

public void OnPluginStart()
{
    RegConsoleCmd("sm_joinspec", commandSpec, "Allows you to join spectator mode");
}

public Action commandSpec(int client, int args)
{
    if (args > 0)
    {
        ReplyToCommand(client, "Usage : <sm_joinspec>");
    }
    
    ChangeClientTeam(client, CS_TEAM_SPECTATOR);
    ReplyToCommand(client, "You have joined Spectator Mode");
}
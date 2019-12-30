Private["_assist","_bounty","_get","_name","_type"];


_killed = _this;
_name = name _killed;

_bounty = if (score _killed < 0) then {100} else {100+11*(score _killed)};
sleep (random 3);

Format[Localize "STR_WF_CHAT_Award_Bounty", _bounty, _name] Call GroupChatMessage;
(_bounty) Call ChangePlayerFunds;
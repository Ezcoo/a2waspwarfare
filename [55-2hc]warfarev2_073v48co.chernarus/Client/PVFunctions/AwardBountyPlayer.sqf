Private["_assist","_bounty","_get","_name","_type","_coef"];

_killed = _this;
_name = name _killed;

_coef = 7*(score _killed);
_coef = _coef^(-0.3);

_bounty = if (score _killed < 0) then {
            180;
          } else {
            100+7*(score _killed) * _coef;
          };
sleep (random 3);

Format[Localize "STR_WF_CHAT_Award_Bounty", _bounty, _name] Call GroupChatMessage;
(_bounty) Call ChangePlayerFunds;
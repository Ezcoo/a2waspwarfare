Private["_assist","_bounty","_get","_name","_type"];


_killed = _this;
_name = name _killed;

_coef = 7*(score _killed);
_coef = _coef^(-0.1);

_bounty = if (score _killed <= 0) then {
            180;
          } else {
            100+14*(score _killed)*_coef;
          };

_bounty = round _bounty;

sleep (random 3);

Format[Localize "STR_WF_CHAT_Award_Bounty", _bounty, _name] Call GroupChatMessage;
(_bounty) Call ChangePlayerFunds;
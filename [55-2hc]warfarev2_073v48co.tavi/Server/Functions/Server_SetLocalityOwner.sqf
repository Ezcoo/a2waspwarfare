/*
	Make an object local to a client.
	 Parameters:
		- Object
		- Locality target (client)
*/

Private ["_object","_local_to"];

_object = _this select 0;
_local_to = _this select 1;

_object setOwner (owner _local_to);
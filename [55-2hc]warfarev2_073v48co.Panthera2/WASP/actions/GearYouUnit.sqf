if( cursorTarget distance player < 3 && cursorTarget in units player ) then
{
	player action ["gear", cursorTarget];
	true;
}
// MADE BY JTS

class RscTitles
{
	titles[] = {};

    class NameTag
    {
        idd = -1;
        Access = ReadAndWrite;
        movingEnable = false;
        fadein = 0.5;
        duration = 1e+1000;
        fadeout = 0;
        name = "NameTag";
        onLoad = "_this execVM 'Client\Module\Nametags\NET_DrawCursorTarget.sqf'";
        controlsBackground[] = {};
        objects[] = {};

        class controls
        {

            class NT_BASIC
            {
                idc = 100;
                type = 13;
                style = 16 + 0x200;
                x = -1;
                y = -1;
                w = 0.4;
                h = 0.1;
                sizeEx = 0.025;
                size = 0.025;
                font = "Zeppelin32";
                linespacing = 1;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,0};
                shadow = true;
                text = "";
            };

            class NT1 : NT_BASIC
            {
                    idc = 101;
            };

        };

    };

};
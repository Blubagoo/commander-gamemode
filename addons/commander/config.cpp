class CfgPatches {
    class CommanderGamemode {
        name = "Commander Gamemode";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.00;
        requiredAddons[] = {};
        author = "Your Name";
    };
};

class CfgFunctions {
    class CommanderGamemode {
        class Functions {
            file = "\commander\functions";
            class init {
                postInit = 1;
            };
        };
    };
};

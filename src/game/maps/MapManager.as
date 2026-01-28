package game.maps {
    import game.Game;
    import game.sound.SoundManager;
    import game.sound.SoundLibrary;

    public class MapManager {
        public static var current:String = "forest";

        // ============================
        // MAP DEFINITIONS
        // ============================

        private static var maps:Object = {
            forest: {
                name: "Forest Park",
                width: 1600,
                height: 1200,
                spawnX: 800,
                spawnY: 600,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/forest.png"
            },

            beach: {
                name: "Sunny Beach",
                width: 1800,
                height: 1300,
                spawnX: 900,
                spawnY: 650,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/beach.png"
            },

            city: {
                name: "City Plaza",
                width: 1400,
                height: 1000,
                spawnX: 700,
                spawnY: 500,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/city.png"
            },

            snow: {
                name: "Snowy Ridge",
                width: 1600,
                height: 1200,
                spawnX: 800,
                spawnY: 600,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/snow.png"
            },

            desert: {
                name: "Desert Dunes",
                width: 2000,
                height: 1400,
                spawnX: 1000,
                spawnY: 700,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/desert.png"
            },

            mountain: {
                name: "Mountain Peak",
                width: 1500,
                height: 1100,
                spawnX: 750,
                spawnY: 550,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/mountain.png"
            },

            meadow: {
                name: "Flower Meadow",
                width: 1600,
                height: 1200,
                spawnX: 800,
                spawnY: 600,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/meadow.png"
            },

            night_forest: {
                name: "Night Forest",
                width: 1600,
                height: 1200,
                spawnX: 800,
                spawnY: 600,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/night_forest.png"
            },

            training_ground: {
                name: "Training Grounds",
                width: 1400,
                height: 1000,
                spawnX: 700,
                spawnY: 500,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/training.png"
            },

            secret_garden: {
                name: "Secret Garden",
                width: 1200,
                height: 900,
                spawnX: 600,
                spawnY: 450,
                ambience: SoundLibrary.AMBIENCE_PARK,
                image: "assets/images/parks/secret_garden.png"
            }
        };

        // ============================
        // GET MAP DATA
        // ============================

        public static function getMap(id:String):Object {
            return maps[id];
        }

        public static function listMaps():Array {
            var arr:Array = [];
            for (var key:String in maps) {
                arr.push({ id: key, name: maps[key].name });
            }
            return arr;
        }

        // ============================
        // LOAD MAP
        // ============================

        public static function load(mapId:String, callback:Function):void {
            if (!maps[mapId]) {
                throw new Error("Unknown map: " + mapId);
            }

            current = mapId;

            // Stop previous ambience
            SoundManager.stopAll();

            // Start new ambience
            var ambience:String = maps[mapId].ambience;
            if (ambience) {
                SoundManager.play(ambience, true);
            }

            // Tell backend we joined this park
            Game.instance.api.joinPark(mapId, function():void {
                callback();
            });
        }

        // ============================
        // SPAWN POINT
        // ============================

        public static function spawnX():Number {
            return maps[current].spawnX;
        }

        public static function spawnY():Number {
            return maps[current].spawnY;
        }

        // ============================
        // MAP IMAGE
        // ============================

        public static function backgroundImage():String {
            return maps[current].image;
        }

        // ============================
        // MAP NAME
        // ============================

        public static function name():String {
            return maps[current].name;
        }
    }
}

package game.quests {
    public class QuestLibrary {
        public static function all():Array {
            return [
                {
                    id: "forest_1",
                    name: "Forest Beginner",
                    description: "Defeat 3 enemies in the Forest Park.",
                    requirement: { type: "kill", count: 3, map: "forest" },
                    reward: { bones: 10, xp: 20 }
                },
                {
                    id: "beach_1",
                    name: "Beach Cleanup",
                    description: "Defeat 2 enemies on the Beach.",
                    requirement: { type: "kill", count: 2, map: "beach" },
                    reward: { bones: 15, xp: 25 }
                },
                {
                    id: "city_1",
                    name: "City Defender",
                    description: "Defeat 1 Stray Bot in the City.",
                    requirement: { type: "kill", count: 1, map: "city" },
                    reward: { bones: 20, xp: 30 }
                }
            ];
        }

        public static function get(id:String):Object {
            var list:Array = all();
            for each (var q:Object in list) {
                if (q.id == id) return q;
            }
            return null;
        }
    }
}

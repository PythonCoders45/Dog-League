package game.achievements {
    public class AchievementLibrary {
        public static function all():Array {
            return [
                {
                    id: "first_kill",
                    name: "First Blood",
                    description: "Defeat your first enemy.",
                    type: "kill",
                    requirement: 1,
                    reward: { xp: 10, bones: 5 }
                },
                {
                    id: "forest_hunter",
                    name: "Forest Hunter",
                    description: "Defeat 10 enemies in the Forest.",
                    type: "kill_forest",
                    requirement: 10,
                    reward: { xp: 25, bones: 15 }
                },
                {
                    id: "walker",
                    name: "Walker",
                    description: "Walk 500 steps.",
                    type: "steps",
                    requirement: 500,
                    reward: { xp: 20 }
                },
                {
                    id: "dog_buddy",
                    name: "Dog Buddy",
                    description: "Let your dog follow you for 5 minutes.",
                    type: "dog_follow_time",
                    requirement: 300, // seconds
                    reward: { xp: 30, bones: 10 }
                },
                {
                    id: "quest_starter",
                    name: "Quest Beginner",
                    description: "Complete your first quest.",
                    type: "quest_complete",
                    requirement: 1,
                    reward: { xp: 40, bones: 20 }
                }
            ];
        }

        public static function get(id:String):Object {
            for each (var a:Object in all()) {
                if (a.id == id) return a;
            }
            return null;
        }
    }
}

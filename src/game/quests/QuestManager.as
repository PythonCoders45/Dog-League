package game.quests {
    import game.Game;

    public class QuestManager {
        public var active:Object = {};   // questId → progress
        public var completed:Object = {}; // questId → true

        public function QuestManager() {}

        public function startQuest(id:String):void {
            if (!active[id] && !completed[id]) {
                active[id] = { progress: 0 };
            }
        }

        public function recordKill(map:String):void {
            for (var id:String in active) {
                var quest:Object = QuestLibrary.get(id);
                if (!quest) continue;

                if (quest.requirement.type == "kill" &&
                    quest.requirement.map == map) {

                    active[id].progress++;

                    if (active[id].progress >= quest.requirement.count) {
                        completed[id] = true;
                        delete active[id];
                    }
                }
            }
        }

        public function isCompleted(id:String):Boolean {
            return completed[id] == true;
        }

        public function claimReward(id:String):Object {
            if (!completed[id]) return null;

            var quest:Object = QuestLibrary.get(id);
            if (!quest) return null;

            // Apply reward
            Game.instance.player.bones += quest.reward.bones;
            Game.instance.player.xp += quest.reward.xp;

            // Mark as claimed
            completed[id] = "claimed";

            return quest.reward;
        }
    }
}

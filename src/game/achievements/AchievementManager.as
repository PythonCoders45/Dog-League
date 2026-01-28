package game.achievements {
    import game.Game;

    public class AchievementManager {
        public var progress:Object = {};   // id → number
        public var unlocked:Object = {};   // id → true

        public function AchievementManager() {}

        public function addProgress(type:String, amount:int = 1):void {
            var list:Array = AchievementLibrary.all();

            for each (var a:Object in list) {
                if (a.type != type) continue;
                if (unlocked[a.id]) continue;

                if (!progress[a.id]) progress[a.id] = 0;

                progress[a.id] += amount;

                if (progress[a.id] >= a.requirement) {
                    unlock(a);
                }
            }
        }

        private function unlock(a:Object):void {
            unlocked[a.id] = true;

            // Apply reward
            if (a.reward.xp) Game.instance.player.xp += a.reward.xp;
            if (a.reward.bones) Game.instance.player.bones += a.reward.bones;

            // Show popup
            Game.instance.screens.showAchievementPopup(a);
        }
    }
}

package game.combat {
    import game.Game;

    public class CombatManager {
        public var playerHP:int;
        public var enemyHP:int;
        public var enemy:Object;

        public var onUpdate:Function;
        public var onEnd:Function;

        public function CombatManager(enemy:Object) {
            this.enemy = enemy;
            this.playerHP = Game.instance.player.stats.hp;
            this.enemyHP = enemy.hp;
        }

        public function playerAttack():void {
            var dmg:int = 5 + Math.random() * 10;
            enemyHP -= dmg;

            if (onUpdate != null) onUpdate();

            if (enemyHP <= 0) {
                if (onEnd != null) onEnd(true);
                return;
            }

            enemyAttack();
        }

        private function enemyAttack():void {
            var dmg:int = enemy.attack + Math.random() * 5;
            playerHP -= dmg;

            if (onUpdate != null) onUpdate();

            if (playerHP <= 0) {
                if (onEnd != null) onEnd(false);
            }
        }
    }
}

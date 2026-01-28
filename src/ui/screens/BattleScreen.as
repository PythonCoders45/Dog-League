package ui.screens {
    import ui.components.*;
    import game.combat.*;
    import game.maps.MapManager;
    import game.Game;

    public class BattleScreen extends UIContainer {
        private var cm:CombatManager;

        private var playerHPLabel:UILabel;
        private var enemyHPLabel:UILabel;
        private var enemyName:UILabel;

        public function BattleScreen(enemy:Object) {
            cm = new CombatManager(enemy);

            cm.onUpdate = updateUI;
            cm.onEnd = endBattle;

            enemyName = new UILabel("Enemy: " + enemy.name, 24);
            enemyName.x = 20;
            enemyName.y = 20;
            addChild(enemyName);

            playerHPLabel = new UILabel("Your HP: " + cm.playerHP, 20);
            playerHPLabel.x = 20;
            playerHPLabel.y = 70;
            addChild(playerHPLabel);

            enemyHPLabel = new UILabel("Enemy HP: " + cm.enemyHP, 20);
            enemyHPLabel.x = 20;
            enemyHPLabel.y = 110;
            addChild(enemyHPLabel);

            var attackBtn:UIButton = new UIButton("Attack", function():void {
                cm.playerAttack();
            });
            attackBtn.x = 20;
            attackBtn.y = 180;
            addChild(attackBtn);

            var runBtn:UIButton = new UIButton("Run", function():void {
                Game.instance.screens.show("ParkScreen");
            });
            runBtn.x = 20;
            runBtn.y = 240;
            addChild(runBtn);
        }

        private function updateUI():void {
            playerHPLabel.text = "Your HP: " + cm.playerHP;
            enemyHPLabel.text = "Enemy HP: " + cm.enemyHP;
        }

        private function endBattle(victory:Boolean):void {
            if (victory) {
                enemyName.text = "You won!";
                Game.instance.quests.recordKill(MapManager.current);
            } else {
                enemyName.text = "You were defeated!";
            }

            // Return to park after 2 seconds
            Game.instance.delay(2000, function():void {
                Game.instance.screens.show("ParkScreen");
            });
        }
    }
}

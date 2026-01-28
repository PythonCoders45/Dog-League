package game {
    import flash.display.Sprite;
    import ui.screens.*;

    public class ScreenManager extends Sprite {
        private var game:Game;
        private var current:Sprite;

        public function ScreenManager(game:Game) {
            this.game = game;
            game.addChild(this);
        }

        public function showBattle(enemy:Object):void {
            showScreen(new BattleScreen(enemy));
        }


        public function show(screenName:String):void {
            if (current && contains(current)) {
                removeChild(current);
            }

            switch(screenName) {
                case "LoginScreen":
                    current = new LoginScreen();
                    break;
                case "RegisterScreen":
                    current = new RegisterScreen();
                    break;
                case "MainMenu":
                    current = new MainMenu();
                    break;
                case "DogScreen":
                    current = new DogScreen();
                    break;
                case "InventoryScreen":
                    current = new InventoryScreen();
                    break;
                case "ParkListScreen":
                    current = new ParkListScreen();
                    break;
                case "ParkScreen":
                    current = new ParkScreen();
                    break;
                case "FluffyScreen":
                    current = new FluffyScreen();
                    break;
                case "ActivityScreen":
                    current = new ActivityScreen();
                    break;
                default:
                    throw new Error("Unknown screen: " + screenName);
            }

            addChild(current);
        }
    }
}

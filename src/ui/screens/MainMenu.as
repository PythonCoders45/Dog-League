package ui.screens {
    import ui.components.*;
    import game.Game;

    public class MainMenu extends UIContainer {
        public function MainMenu() {
            addChild(new UILabel("Main Menu", 28)).y = 20;

            var dogBtn:UIButton = new UIButton("My Dog", function():void {
                Game.instance.screens.show("DogScreen");
            });
            dogBtn.y = 80;
            addChild(dogBtn);

            var invBtn:UIButton = new UIButton("Inventory", function():void {
                Game.instance.screens.show("InventoryScreen");
            });
            invBtn.y = 130;
            addChild(invBtn);

            var parkBtn:UIButton = new UIButton("Parks", function():void {
                Game.instance.screens.show("ParkListScreen");
            });
            parkBtn.y = 180;
            addChild(parkBtn);

            var fluffyBtn:UIButton = new UIButton("Fluffies", function():void {
                Game.instance.screens.show("FluffyScreen");
            });
            fluffyBtn.y = 230;
            addChild(fluffyBtn);

            var actBtn:UIButton = new UIButton("Activities", function():void {
                Game.instance.screens.show("ActivityScreen");
            });
            actBtn.y = 280;
            addChild(actBtn);

            var questBtn:UIButton = new UIButton("Quest Log", function():void {
                Game.instance.screens.show("QuestLogScreen");
            });
            questBtn.y = 330;
            addChild(questBtn);
            var achBtn:UIButton = new UIButton("Achievements", function():void {
                Game.instance.screens.show("AchievementsScreen");
            });
            achBtn.y = 380;
            addChild(achBtn);
            var friendsBtn:UIButton = new UIButton("Friends", function():void {
                Game.instance.screens.showFriends();
            });
            friendsBtn.x = 20;
            friendsBtn.y = 280;
            addChild(friendsBtn);


        }
    }
}

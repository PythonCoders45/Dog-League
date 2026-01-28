package ui.screens {
    import ui.components.*;
    import game.Game;

    public class FluffyScreen extends UIContainer {
        public function FluffyScreen() {
            addChild(new UILabel("My Fluffies", 28)).y = 20;

            Game.instance.api.listFluffies(function(res:ApiResponse):void {
                if (res.ok()) {
                    var yPos:int = 80;
                    for each (var f:Object in res.data) {
                        var card:FluffyCard = new FluffyCard(f);
                        card.y = yPos;
                        addChild(card);
                        yPos += 130;
                    }
                }
            });

            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.y = 350;
            addChild(back);
        }
    }
}

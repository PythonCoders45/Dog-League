package ui.screens {
    import ui.components.*;
    import game.Game;

    public class DogScreen extends UIContainer {
        public function DogScreen() {
            addChild(new UILabel("My Dog", 28)).y = 20;

            Game.instance.api.getMyDog(function(res:ApiResponse):void {
                if (res.ok()) {
                    var card:DogCard = new DogCard(res.data);
                    card.y = 80;
                    addChild(card);
                }
            });

            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.y = 220;
            addChild(back);
        }
    }
}

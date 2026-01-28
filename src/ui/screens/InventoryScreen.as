package ui.screens {
    import ui.components.*;
    import game.Game;

    public class InventoryScreen extends UIContainer {
        public function InventoryScreen() {
            addChild(new UILabel("Inventory", 28)).y = 20;

            Game.instance.api.getInventory(function(res:ApiResponse):void {
                if (res.ok()) {
                    var yPos:int = 80;
                    for each (var item:Object in res.data) {
                        var card:ItemCard = new ItemCard(item.item);
                        card.y = yPos;
                        addChild(card);
                        yPos += 110;
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

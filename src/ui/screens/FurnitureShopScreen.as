package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.housing.*;

    public class FurnitureShopScreen extends UIContainer {
        public function FurnitureShopScreen() {
            var title:UILabel = new UILabel("Furniture Shop", 28);
            title.x = 20;
            title.y = 20;
            addChild(title);

            var list:UIVStack = new UIVStack(15);
            list.x = 20;
            list.y = 80;
            addChild(list);

            for each (var f:Object in FurnitureLibrary.all()) {
                var btn:UIButton = new UIButton("Buy " + f.name, function(id:String = f.id):void {
                    Game.instance.player.house.furniture.push({
                        id: id,
                        x: 200,
                        y: 200
                    });
                    Game.instance.screens.show("HouseScreen");
                });
                list.addElement(btn);
            }

            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("HouseScreen");
            });
            back.x = 20;
            back.y = 400;
            addChild(back);
        }
    }
}

package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.housing.*;

    import flash.display.Sprite;
    import flash.events.MouseEvent;


    var housing:HousingSystem = Game.instance.player.housing;
    var indoorFurniture:Array = housing.getFurnitureForArea("indoor");
    var yardFurniture:Array = housing.getFurnitureForArea("yard");
    var bgPath:String = housing.getBackgroundImage();

    public class HouseScreen extends UIContainer {
        private var house:HouseData;
        private var furnitureLayer:Sprite;

        public function HouseScreen() {
            house = Game.instance.player.house;

            // Background
            var bg:Loader = new Loader();
            bg.load(new URLRequest("assets/houses/" + house.background + ".png"));
            addChild(bg);

            // Furniture layer
            furnitureLayer = new Sprite();
            addChild(furnitureLayer);

            // Load furniture
            for each (var f:Object in house.furniture) {
                addFurnitureToScreen(f);
            }

            // Add furniture button
            var addBtn:UIButton = new UIButton("Add Furniture", function():void {
                Game.instance.screens.show("FurnitureShopScreen");
            });
            addBtn.x = 20;
            addBtn.y = 20;
            addChild(addBtn);

            // Save button
            var saveBtn:UIButton = new UIButton("Save Layout", saveLayout);
            saveBtn.x = 20;
            saveBtn.y = 70;
            addChild(saveBtn);

            // Back
            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.x = 20;
            back.y = 120;
            addChild(back);
        }

        private function addFurnitureToScreen(f:Object):void {
            var item:FurnitureItem = new FurnitureItem(FurnitureLibrary.get(f.id));
            item.x = f.x;
            item.y = f.y;
            furnitureLayer.addChild(item);
        }

        private function saveLayout():void {
            house.furniture = [];

            for (var i:int = 0; i < furnitureLayer.numChildren; i++) {
                var item:FurnitureItem = furnitureLayer.getChildAt(i) as FurnitureItem;
                house.furniture.push({
                    id: item.data.id,
                    x: item.x,
                    y: item.y
                });
            }

            Game.instance.saveHouse();
        }

        // After dragging ends:
        housing.moveFurniture(index, item.x, item.y);

        // On rotate button:
        housing.rotateFurniture(index);
        item.rotation = housing.furniture[index].rotation;

    }
}

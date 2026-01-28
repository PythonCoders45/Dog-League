package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.maps.MapManager;

    public class ParkListScreen extends UIContainer {
        public function ParkListScreen() {
            // Title
            var title:UILabel = new UILabel("Choose a Park", 28);
            title.x = 20;
            title.y = 20;
            addChild(title);

            // Vertical stack for map buttons
            var list:UIVStack = new UIVStack(15);
            list.x = 20;
            list.y = 80;
            addChild(list);

            // Get all maps from MapManager
            var maps:Array = MapManager.listMaps();

            for each (var m:Object in maps) {
                var btn:UIButton = new UIButton(m.name, function(mapId:String = m.id):void {
                    MapManager.load(mapId, function():void {
                        Game.instance.screens.show("ParkScreen");
                    });
                });

                list.addElement(btn);
            }

            // Back button
            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.x = 20;
            back.y = 400;
            addChild(back);
        }
    }
}

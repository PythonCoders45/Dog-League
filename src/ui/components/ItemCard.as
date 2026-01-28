package ui.components {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import game.AssetLoader;

    public class ItemCard extends Sprite {
        public function ItemCard(item:Object) {
            AssetLoader.load("assets/images/ui/panel.png", function(bg:Loader):void {
                bg.width = 250;
                bg.height = 100;
                addChild(bg);
            });

            var imgPath:String = "assets/images/items/" + (item.image || "default") + ".png";
            AssetLoader.load(imgPath, function(img:Loader):void {
                img.x = 10;
                img.y = 10;
                img.width = 48;
                img.height = 48;
                addChild(img);
            });

            var tf:TextField = new TextField();
            tf.defaultTextFormat = new TextFormat("_sans", 16, 0xFFFFFF);
            tf.width = 240;
            tf.height = 100;
            tf.x = 70;
            tf.y = 10;
            tf.text =
                "Item: " + item.name + "\n" +
                "Type: " + item.type + "\n" +
                "Rarity: " + item.rarity;

            addChild(tf);
        }
    }
}

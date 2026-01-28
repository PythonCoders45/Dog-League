package ui.components {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import game.AssetLoader;

    public class FluffyCard extends Sprite {
        public function FluffyCard(f:Object) {
            AssetLoader.load("assets/images/ui/panel.png", function(bg:Loader):void {
                bg.width = 250;
                bg.height = 150;
                addChild(bg);
            });

            var imgPath:String = "assets/images/fluffies/" + (f.image || "default") + ".png";
            AssetLoader.load(imgPath, function(img:Loader):void {
                img.x = 10;
                img.y = 10;
                img.width = 64;
                img.height = 64;
                addChild(img);
            });

            var tf:TextField = new TextField();
            tf.defaultTextFormat = new TextFormat("_sans", 16, 0xFFFFFF);
            tf.width = 240;
            tf.height = 120;
            tf.x = 80;
            tf.y = 10;
            tf.text =
                "Name: " + f.name + "\n" +
                "Species: " + f.species + "\n" +
                "Mood: " + f.mood + "\n" +
                "Energy: " + f.energy;

            addChild(tf);
        }
    }
}

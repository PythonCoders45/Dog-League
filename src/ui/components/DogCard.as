package ui.components {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import game.AssetLoader;

    public class DogCard extends Sprite {
        public function DogCard(dog:Object) {
            AssetLoader.load("assets/images/ui/panel.png", function(bg:Loader):void {
                bg.width = 250;
                bg.height = 150;
                addChild(bg);
            });

            // Dog image
            var imgPath:String = "assets/images/dogs/" + (dog.image || "default") + ".png";
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
                "Name: " + dog.name + "\n" +
                "Breed: " + dog.breed + "\n" +
                "Mood: " + dog.mood + "\n" +
                "Bones: " + dog.bones;

            addChild(tf);
        }
    }
}

package ui.components {
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class ParkPlayerSprite extends Sprite {
        private var nameLabel:TextField;

        public function ParkPlayerSprite(username:String) {
            graphics.beginFill(0x00AAFF);
            graphics.drawCircle(0, 0, 20);
            graphics.endFill();

            nameLabel = new TextField();
            nameLabel.defaultTextFormat = new TextFormat("_sans", 14, 0xFFFFFF);
            nameLabel.text = username;
            nameLabel.width = 100;
            nameLabel.height = 20;
            nameLabel.x = -50;
            nameLabel.y = -40;
            nameLabel.selectable = false;
            addChild(nameLabel);
        }
    }
}

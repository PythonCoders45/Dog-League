package ui.components {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import game.AssetLoader;

    public class ChatBox extends Sprite {
        private var field:TextField;

        public function ChatBox(width:int = 300, height:int = 200) {
            AssetLoader.load("assets/images/ui/panel.png", function(bg:Loader):void {
                bg.width = width;
                bg.height = height;
                addChild(bg);
            });

            field = new TextField();
            field.defaultTextFormat = new TextFormat("_sans", 14, 0xFFFFFF);
            field.width = width - 10;
            field.height = height - 10;
            field.x = 5;
            field.y = 5;
            field.multiline = true;
            field.wordWrap = true;
            field.selectable = false;

            addChild(field);
        }

        public function addMessage(msg:String):void {
            field.appendText(msg + "\n");
            field.scrollV = field.maxScrollV;
        }
    }
}

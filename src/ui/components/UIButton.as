package ui.components {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.events.MouseEvent;
    import game.AssetLoader;

    public class UIButton extends Sprite {
        private var label:TextField;
        private var callback:Function;

        public function UIButton(text:String, callback:Function) {
            this.callback = callback;

            AssetLoader.load("assets/images/ui/button.png", function(bg:Loader):void {
                addChild(bg);
            });

            label = new TextField();
            label.defaultTextFormat = new TextFormat("_sans", 18, 0xFFFFFF, true);
            label.text = text;
            label.width = 180;
            label.height = 40;
            label.selectable = false;
            label.mouseEnabled = false;
            label.x = 10;
            label.y = 8;
            addChild(label);

            buttonMode = true;
            addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onClick(e:MouseEvent):void {
            if (callback != null) callback();
        }
    }
}

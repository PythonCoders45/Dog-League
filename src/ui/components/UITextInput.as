package ui.components {
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.text.TextFormat;
    import flash.display.Loader;
    import game.AssetLoader;

    public class UITextInput extends TextField {
        public function UITextInput(width:int = 200, password:Boolean = false) {
            defaultTextFormat = new TextFormat("_sans", 18, 0x000000);

            this.type = TextFieldType.INPUT;
            this.width = width;
            this.height = 30;
            this.border = false;
            this.background = false;

            if (password) {
                this.displayAsPassword = true;
            }

            // Background image
            AssetLoader.load("assets/images/ui/input.png", function(bg:Loader):void {
                bg.width = width;
                bg.height = 30;
                parent.addChildAt(bg, parent.getChildIndex(this));
            });
        }
    }
}

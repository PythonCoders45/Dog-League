package ui.components {
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class UILabel extends TextField {
        public function UILabel(text:String, size:int = 18, color:uint = 0xFFFFFF) {
            defaultTextFormat = new TextFormat("_sans", size, color);
            this.text = text;
            this.width = 400;
            this.height = size + 10;
            this.selectable = false;
        }
    }
}

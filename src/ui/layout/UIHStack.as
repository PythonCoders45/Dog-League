package ui.layout {
    import flash.display.Sprite;

    public class UIHStack extends Sprite {
        private var spacing:int;

        public function UIHStack(spacing:int = 10) {
            this.spacing = spacing;
        }

        public function addElement(obj:Sprite):void {
            if (numChildren == 0) {
                obj.x = 0;
            } else {
                var last:Sprite = getChildAt(numChildren - 1) as Sprite;
                obj.x = last.x + last.width + spacing;
            }
            addChild(obj);
        }
    }
}

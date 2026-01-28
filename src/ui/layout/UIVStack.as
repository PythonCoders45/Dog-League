package ui.layout {
    import flash.display.Sprite;

    public class UIVStack extends Sprite {
        private var spacing:int;

        public function UIVStack(spacing:int = 10) {
            this.spacing = spacing;
        }

        public function addElement(obj:Sprite):void {
            if (numChildren == 0) {
                obj.y = 0;
            } else {
                var last:Sprite = getChildAt(numChildren - 1) as Sprite;
                obj.y = last.y + last.height + spacing;
            }
            addChild(obj);
        }
    }
}

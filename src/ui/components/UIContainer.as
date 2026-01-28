package ui.components {
    import flash.display.Sprite;

    public class UIContainer extends Sprite {
        public function UIContainer() {
            this.mouseEnabled = true;
            this.mouseChildren = true;
        }

        public function clear():void {
            while (numChildren > 0) {
                removeChildAt(0);
            }
        }
    }
}

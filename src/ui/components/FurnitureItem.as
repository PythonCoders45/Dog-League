package ui.components {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.MouseEvent;

    public class FurnitureItem extends Sprite {
        public var data:Object;

        private var dragging:Boolean = false;

        public function FurnitureItem(data:Object) {
            this.data = data;

            var loader:Loader = new Loader();
            loader.load(new URLRequest(data.image));
            addChild(loader);

            buttonMode = true;

            addEventListener(MouseEvent.MOUSE_DOWN, startDragItem);
            addEventListener(MouseEvent.MOUSE_UP, stopDragItem);
        }

        private function startDragItem(e:MouseEvent):void {
            dragging = true;
            startDrag();
        }

        private function stopDragItem(e:MouseEvent):void {
            dragging = false;
            stopDrag();
        }
    }
}

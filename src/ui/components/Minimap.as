package ui.components {
    import flash.display.Sprite;

    public class Minimap extends Sprite {
        public function Minimap() {
            graphics.beginFill(0x000000, 0.5);
            graphics.drawRect(0, 0, 150, 150);
            graphics.endFill();
        }
    }
}

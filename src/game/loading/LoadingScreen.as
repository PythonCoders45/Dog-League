package ui.screens {
    import ui.components.UIContainer;
    import ui.components.UILabel;
    import flash.display.Sprite;

    public class LoadingScreen extends UIContainer {
        private var bar:Sprite;

        public function LoadingScreen() {
            var title:UILabel = new UILabel("Loading...", 28);
            title.x = 300;
            title.y = 200;
            addChild(title);

            bar = new Sprite();
            bar.graphics.beginFill(0x00FF00);
            bar.graphics.drawRect(0, 0, 1, 20);
            bar.graphics.endFill();
            bar.x = 200;
            bar.y = 260;
            addChild(bar);
        }

        public function setProgress(p:Number):void {
            bar.width = 400 * p;
        }
    }
}

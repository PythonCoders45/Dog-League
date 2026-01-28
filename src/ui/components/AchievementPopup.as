package ui.components {
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.events.Event;

    public class AchievementPopup extends Sprite {
        private var life:int = 120; // frames

        public function AchievementPopup(a:Object) {
            graphics.beginFill(0x333333, 0.9);
            graphics.drawRoundRect(0, 0, 300, 80, 12);
            graphics.endFill();

            var tf:TextField = new TextField();
            tf.defaultTextFormat = new TextFormat("_sans", 18, 0xFFD700, true);
            tf.width = 280;
            tf.height = 60;
            tf.x = 10;
            tf.y = 10;
            tf.text = "Achievement Unlocked:\n" + a.name;
            tf.selectable = false;
            addChild(tf);

            addEventListener(Event.ENTER_FRAME, fadeOut);
        }

        private function fadeOut(e:Event):void {
            life--;
            if (life < 30) alpha -= 0.03;
            if (life <= 0) {
                removeEventListener(Event.ENTER_FRAME, fadeOut);
                if (parent) parent.removeChild(this);
            }
        }
    }
}

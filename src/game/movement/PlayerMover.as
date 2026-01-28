package game.movement {
    import flash.display.Sprite;
    import flash.events.Event;

    public class PlayerMover {
        private var sprite:Sprite;
        private var speed:Number = 4;
        private var targetX:Number;
        private var targetY:Number;
        private var moving:Boolean = false;

        public function PlayerMover(sprite:Sprite) {
            this.sprite = sprite;
            sprite.addEventListener(Event.ENTER_FRAME, update);
        }

        public function moveTo(x:Number, y:Number):void {
            targetX = x;
            targetY = y;
            moving = true;
        }

        private function update(e:Event):void {
            if (!moving) return;

            var dx:Number = targetX - sprite.x;
            var dy:Number = targetY - sprite.y;
            var dist:Number = Math.sqrt(dx*dx + dy*dy);

            if (dist < 2) {
                moving = false;
                return;
            }

            sprite.x += dx / dist * speed;
            sprite.y += dy / dist * speed;
        }
    }
}

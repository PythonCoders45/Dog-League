package game.pet {
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.utils.getTimer;

    public class DogAI {
        private var dog:DisplayObject;
        private var target:DisplayObject;

        private var followDistance:Number = 80;
        private var speed:Number = 3;

        private var wandering:Boolean = false;
        private var wanderTargetX:Number;
        private var wanderTargetY:Number;

        public function DogAI(dog:DisplayObject, target:DisplayObject) {
            this.dog = dog;
            this.target = target;
            dog.addEventListener(Event.ENTER_FRAME, update);
        }

        private function update(e:Event):void {
            var dx:Number = target.x - dog.x;
            var dy:Number = target.y - dog.y;
            var dist:Number = Math.sqrt(dx * dx + dy * dy);

            if (dist > followDistance) {
                // Follow player
                wandering = false;
                moveTowards(target.x, target.y);
            } else {
                // Close enough — maybe wander a bit
                if (!wandering) {
                    startWander();
                }
                moveTowards(wanderTargetX, wanderTargetY);

                var wdx:Number = wanderTargetX - dog.x;
                var wdy:Number = wanderTargetY - dog.y;
                var wdist:Number = Math.sqrt(wdx * wdx + wdy * wdy);
                if (wdist < 5) {
                    wandering = false;
                }
            }
        }

        private function moveTowards(tx:Number, ty:Number):void {
            var dx:Number = tx - dog.x;
            var dy:Number = ty - dog.y;
            var dist:Number = Math.sqrt(dx * dx + dy * dy);
            if (dist < 1) return;

            dog.x += dx / dist * speed;
            dog.y += dy / dist * speed;
        }

        private function startWander():void {
            wandering = true;
            // Pick a small random offset around the player
            var angle:Number = Math.random() * Math.PI * 2;
            var radius:Number = 40 + Math.random() * 40;
            wanderTargetX = target.x + Math.cos(angle) * radius;
            wanderTargetY = target.y + Math.sin(angle) * radius;
        }

        public function dispose():void {
            dog.removeEventListener(Event.ENTER_FRAME, update);
        }
    }
}

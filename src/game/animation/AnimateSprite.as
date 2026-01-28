package game.animation {
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.events.Event;
    import game.AssetLoader;

    public class AnimatedSprite extends Sprite {
        private var animator:Animator = new Animator();
        private var frameIndex:int = 0;
        private var frameCounter:int = 0;
        private var currentFrames:Array = [];
        private var currentImage:Loader;

        public function AnimatedSprite() {
            addEventListener(Event.ENTER_FRAME, update);
        }

        public function addAnimation(name:String, frames:Array, speed:int = 4, loop:Boolean = true):void {
            animator.add(name, new FrameAnimation(frames, speed, loop));
        }

        public function play(name:String):void {
            var anim:FrameAnimation = animator.play(name);
            currentFrames = anim.frames;
            frameIndex = 0;
            frameCounter = 0;
            loadFrame();
        }

        private function loadFrame():void {
            if (currentImage && contains(currentImage)) {
                removeChild(currentImage);
            }

            var path:String = currentFrames[frameIndex];
            AssetLoader.load(path, function(img:Loader):void {
                currentImage = img;
                addChild(img);
            });
        }

        private function update(e:Event):void {
            var anim:FrameAnimation = animator.currentAnimation;
            if (!anim) return;

            frameCounter++;
            if (frameCounter >= anim.speed) {
                frameCounter = 0;
                frameIndex++;

                if (frameIndex >= currentFrames.length) {
                    if (anim.loop) frameIndex = 0;
                    else frameIndex = currentFrames.length - 1;
                }

                loadFrame();
            }
        }
    }
}

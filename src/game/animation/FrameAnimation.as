package game.animation {
    public class FrameAnimation {
        public var frames:Array;
        public var speed:int; // frames per update
        public var loop:Boolean;

        public function FrameAnimation(frames:Array, speed:int = 4, loop:Boolean = true) {
            this.frames = frames;
            this.speed = speed;
            this.loop = loop;
        }
    }
}

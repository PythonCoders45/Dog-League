package game.animation {
    public class Animator {
        private var animations:Object = {};
        private var current:String = null;

        public function add(name:String, anim:FrameAnimation):void {
            animations[name] = anim;
        }

        public function play(name:String):FrameAnimation {
            current = name;
            return animations[name];
        }

        public function get currentAnimation():FrameAnimation {
            return animations[current];
        }
    }
}

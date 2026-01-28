package game.realtime {
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    public class RealtimePoller {
        private var timer:Timer;
        private var callback:Function;

        public function RealtimePoller(interval:int, callback:Function) {
            this.callback = callback;
            timer = new Timer(interval);
            timer.addEventListener(TimerEvent.TIMER, onTick);
        }

        public function start():void {
            timer.start();
        }

        public function stop():void {
            timer.stop();
        }

        private function onTick(e:TimerEvent):void {
            callback();
        }
    }
}

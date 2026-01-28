package game.loading {
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class Preloader {
        private var assets:Array;
        private var index:int = 0;
        private var onProgress:Function;
        private var onComplete:Function;

        public function Preloader(assets:Array, onProgress:Function, onComplete:Function) {
            this.assets = assets;
            this.onProgress = onProgress;
            this.onComplete = onComplete;
        }

        public function start():void {
            loadNext();
        }

        private function loadNext():void {
            if (index >= assets.length) {
                onComplete();
                return;
            }

            var path:String = assets[index];
            var loader:Loader = new Loader();

            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
                index++;
                onProgress(index / assets.length);
                loadNext();
            });

            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void {
                trace("Failed to load asset: " + path);
                index++;
                onProgress(index / assets.length);
                loadNext();
            });

            loader.load(new URLRequest(path));
        }
    }
}

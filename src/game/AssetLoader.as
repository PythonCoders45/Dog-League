package game {
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.Dictionary;

    public class AssetLoader {
        private static var cache:Dictionary = new Dictionary();

        public static function load(path:String, callback:Function):void {
            if (cache[path]) {
                callback(cache[path]);
                return;
            }

            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
                cache[path] = loader;
                callback(loader);
            });

            loader.load(new URLRequest(path));
        }
    }
}

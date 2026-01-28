package {
    import flash.display.Sprite;
    import flash.events.Event;
    import game.Game;
    import ui.screens.LoadingScreen;
    import game.loading.Preloader;
    import game.loading.AssetManifest;

    [SWF(width="800", height="600", backgroundColor="#222222", frameRate="60")]
    public class Main extends Sprite {
        private var loading:LoadingScreen;

        public function Main() {
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            loading = new LoadingScreen();
            addChild(loading);

            var preloader:Preloader = new Preloader(
                AssetManifest.all(),
                function(progress:Number):void {
                    loading.setProgress(progress);
                },
                function():void {
                    startGame();
                }
            );

            preloader.start();
        }

        private function startGame():void {
            removeChild(loading);

            var apiUrl:String = "https://your-railway-url.up.railway.app";
            var game:Game = new Game(apiUrl);
            addChild(game);
        }
    }
}

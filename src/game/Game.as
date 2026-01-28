package game {
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.utils.setTimeout;

    import net.ApiClient;

    import game.social.friends;
    import game.quests.QuestManager;
    import game.achievements.AchievementManager;

    import ui.screens.MainMenu;
    import ui.screens.FriendsScreen;
    import ui.screens.QuestLogScreen;
    import ui.screens.AchievementsScreen;
    import ui.screens.ParkScreen;
    import ui.screens.ParkListScreen;
    import ui.screens.BattleScreen;

    public class Game extends Sprite {
        // ============================
        // SINGLETON
        // ============================

        public static var instance:Game;

        // ============================
        // CORE SYSTEMS
        // ============================

        public var api:ApiClient;
        public var screens:ScreenManager;
        public var player:PlayerData;

        public var quests:QuestManager;
        public var achievements:AchievementManager;
        public var friends:friends;

        private var friendTimer:Timer;

        // ============================
        // CONSTRUCTOR
        // ============================

        public function Game(apiUrl:String) {
            instance = this;

            api = new ApiClient(apiUrl);
            screens = new ScreenManager(this);
            player = new PlayerData();

            quests = new QuestManager();
            achievements = new AchievementManager();
            friends = new friends();

            addChild(screens);

            startFriendUpdates();

            screens.show("MainMenu");
        }

        // ============================
        // FRIEND UPDATES
        // ============================

        private function startFriendUpdates():void {
            friendTimer = new Timer(5000);
            friendTimer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
                friends.updateOnlineStatus();
            });
            friendTimer.start();
        }

        // ============================
        // DELAY HELPER
        // ============================

        public function delay(ms:int, callback:Function):void {
            setTimeout(callback, ms);
        }
    }
}

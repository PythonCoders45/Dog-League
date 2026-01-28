package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.realtime.RealtimePoller;
    import game.realtime.ParkPresence;
    import game.sound.SoundManager;
    import game.sound.SoundLibrary;

    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class ParkScreen extends UIContainer {
        private var chat:ChatBox;
        private var input:UITextInput;
        private var sendBtn:UIButton;
        private var leaveBtn:UIButton;

        private var poller:RealtimePoller;
        private var presence:ParkPresence = new ParkPresence();
        private var playerSprites:Object = {};
        private var myPlayer:Sprite;
        private var mover:PlayerMover;

        public function ParkScreen() {
            // Title
            var title:UILabel = new UILabel("Dog Park", 28);
            title.x = 20;
            title.y = 20;
            addChild(title);

            // Chat box
            chat = new ChatBox(350, 220);
            chat.x = 20;
            chat.y = 80;
            addChild(chat);

            // Input field
            input = new UITextInput(260);
            input.x = 20;
            input.y = 320;
            addChild(input);

            // Send button
            sendBtn = new UIButton("Send", onSend);
            sendBtn.x = 290;
            sendBtn.y = 320;
            addChild(sendBtn);

            // Leave button
            leaveBtn = new UIButton("Leave Park", function():void {
                poller.stop();
                SoundManager.stopAll();
                Game.instance.screens.show("ParkListScreen");
            });
            leaveBtn.x = 20;
            leaveBtn.y = 370;
            addChild(leaveBtn);

            // Start ambience
            SoundManager.stopAll();
            SoundManager.play(SoundLibrary.AMBIENCE_PARK, true);

            // Start polling for real-time updates
            poller = new RealtimePoller(1500, updatePresence);
            poller.start();

            // Initial chat load
            refreshChat();
        }

        // -----------------------------
        // CHAT SYSTEM
        // -----------------------------

        private function refreshChat():void {
            Game.instance.api.getChat(1, function(res:ApiResponse):void {
                if (res.ok()) {
                    chat.addMessage("=== Chat Updated ===");
                    for each (var msg:Object in res.data) {
                        chat.addMessage(msg.username + ": " + msg.message);
                    }
                }
            });
        }

        private function onSend():void {
            if (input.text.length == 0) return;

            Game.instance.api.sendChat(1, input.text, function():void {
                input.text = "";
                refreshChat();
            });
        }
        
        private function tryStartBattle():void {
            var enemy:Object = EnemyLibrary.randomEnemy(MapManager.current);
            Game.instance.screens.showBattle(enemy);
        }


        private function setupPlayer():void {
            myPlayer = new Sprite();
            myPlayer.graphics.beginFill(0x00FF00);
            myPlayer.graphics.drawCircle(0, 0, 20);
            myPlayer.graphics.endFill();
            myPlayer.x = 500;
            myPlayer.y = 300;
            addChild(myPlayer);

            mover = new PlayerMover(myPlayer);

            stage.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
                mover.moveTo(e.stageX, e.stageY);
            });
        }
        // -----------------------------
        // REAL-TIME MULTIPLAYER
        // -----------------------------

        private function updatePresence():void {
            presence.update(function(players:Array):void {
                for each (var p:Object in players) {
                    // Skip self
                    if (p.username == Game.instance.player.user.username) continue;

                    // Already exists?
                    if (!playerSprites[p.username]) {
                        var sprite:ParkPlayerSprite = new ParkPlayerSprite(p.username);
                        sprite.x = 420 + Math.random() * 300;
                        sprite.y = 100 + Math.random() * 250;
                        addChild(sprite);
                        playerSprites[p.username] = sprite;
                    }
                }
            });
        }
    }
}

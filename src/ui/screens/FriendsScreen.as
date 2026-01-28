package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.social.friends;

    public class FriendsScreen extends UIContainer {
        private var listStack:UIVStack;
        private var requestStack:UIVStack;
        private var addInput:UITextInput;

        public function FriendsScreen() {
            var title:UILabel = new UILabel("Friends", 28);
            title.x = 20;
            title.y = 20;
            addChild(title);

            // ============================
            // FRIEND LIST SECTION
            // ============================

            var listLabel:UILabel = new UILabel("Your Friends:", 22);
            listLabel.x = 20;
            listLabel.y = 70;
            addChild(listLabel);

            listStack = new UIVStack(10);
            listStack.x = 20;
            listStack.y = 110;
            addChild(listStack);

            // ============================
            // FRIEND REQUESTS SECTION
            // ============================

            var reqLabel:UILabel = new UILabel("Friend Requests:", 22);
            reqLabel.x = 420;
            reqLabel.y = 70;
            addChild(reqLabel);

            requestStack = new UIVStack(10);
            requestStack.x = 420;
            requestStack.y = 110;
            addChild(requestStack);

            // ============================
            // ADD FRIEND SECTION
            // ============================

            addInput = new UITextInput(200);
            addInput.x = 20;
            addInput.y = 380;
            addChild(addInput);

            var addBtn:UIButton = new UIButton("Add Friend", onAddFriend);
            addBtn.x = 240;
            addBtn.y = 380;
            addChild(addBtn);

            // Back button
            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.x = 20;
            back.y = 440;
            addChild(back);

            refresh();
        }

        // ============================
        // REFRESH UI
        // ============================

        private function refresh():void {
            var f:friends = Game.instance.friends;

            // Clear stacks
            listStack.clear();
            requestStack.clear();

            // Update online status simulation
            f.updateOnlineStatus();

            // ----------------------------
            // FRIEND LIST
            // ----------------------------

            for each (var fr:Object in f.list) {
                var row:UIContainer = new UIContainer();

                var label:UILabel = new UILabel(
                    fr.username + "  (" + (fr.online ? "Online" : "Offline") + ")",
                    20
                );
                row.addChild(label);

                var removeBtn:UIButton = new UIButton("Remove", function(name:String = fr.username):void {
                    Game.instance.friends.removeFriend(name);
                    refresh();
                });
                removeBtn.x = 250;
                row.addChild(removeBtn);

                listStack.addElement(row);
            }

            // ----------------------------
            // FRIEND REQUESTS
            // ----------------------------

            for each (var req:Object in f.requests) {
                var reqRow:UIContainer = new UIContainer();

                var reqLabel:UILabel = new UILabel(req.from, 20);
                reqRow.addChild(reqLabel);

                var acceptBtn:UIButton = new UIButton("Accept", function(name:String = req.from):void {
                    Game.instance.friends.acceptRequest(name);
                    refresh();
                });
                acceptBtn.x = 150;
                reqRow.addChild(acceptBtn);

                var declineBtn:UIButton = new UIButton("Decline", function(name:String = req.from):void {
                    Game.instance.friends.declineRequest(name);
                    refresh();
                });
                declineBtn.x = 250;
                reqRow.addChild(declineBtn);

                requestStack.addElement(reqRow);
            }
        }

        // ============================
        // ADD FRIEND
        // ============================

        private function onAddFriend():void {
            var name:String = addInput.text;
            if (name.length == 0) return;

            if (Game.instance.friends.sendRequest(name)) {
                addInput.text = "";
                refresh();
            }
        }
    }
}

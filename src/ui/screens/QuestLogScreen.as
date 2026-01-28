package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.quests.*;

    public class QuestLogScreen extends UIContainer {
        public function QuestLogScreen() {
            var title:UILabel = new UILabel("Quest Log", 28);
            title.x = 20;
            title.y = 20;
            addChild(title);

            var list:UIVStack = new UIVStack(15);
            list.x = 20;
            list.y = 80;
            addChild(list);

            var qm:QuestManager = Game.instance.quests;

            // Active quests
            for (var id:String in qm.active) {
                var q:Object = QuestLibrary.get(id);
                var progress:int = qm.active[id].progress;

                var card:UILabel = new UILabel(
                    q.name + " (" + progress + "/" + q.requirement.count + ")",
                    20
                );
                list.addElement(card);
            }

            // Completed quests
            for (id in qm.completed) {
                if (qm.completed[id] == true) {
                    var cq:Object = QuestLibrary.get(id);

                    var btn:UIButton = new UIButton("Claim: " + cq.name, function(qid:String = id):void {
                        var reward:Object = qm.claimReward(qid);
                        Game.instance.screens.show("QuestLogScreen");
                    });

                    list.addElement(btn);
                }
            }

            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.x = 20;
            back.y = 400;
            addChild(back);
        }
    }
}

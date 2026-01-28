package ui.screens {
    import ui.components.*;
    import ui.layout.*;
    import game.Game;
    import game.achievements.*;

    public class AchievementsScreen extends UIContainer {
        public function AchievementsScreen() {
            var title:UILabel = new UILabel("Achievements", 28);
            title.x = 20;
            title.y = 20;
            addChild(title);

            var list:UIVStack = new UIVStack(15);
            list.x = 20;
            list.y = 80;
            addChild(list);

            var am:AchievementManager = Game.instance.achievements;

            for each (var a:Object in AchievementLibrary.all()) {
                var status:String = am.unlocked[a.id] ? "✔" : "✖";
                var label:UILabel = new UILabel(status + " " + a.name, 20);
                list.addElement(label);
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

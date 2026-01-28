package ui.screens {
    import ui.components.*;
    import game.Game;

    public class ActivityScreen extends UIContainer {
        public function ActivityScreen() {
            addChild(new UILabel("Activities", 28)).y = 20;

            var walk:UIButton = new UIButton("Start Walk", function():void {
                Game.instance.api.startActivity("walk", function():void {});
            });
            walk.y = 80;
            addChild(walk);

            var run:UIButton = new UIButton("Start Run", function():void {
                Game.instance.api.startActivity("run", function():void {});
            });
            run.y = 130;
            addChild(run);

            var back:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("MainMenu");
            });
            back.y = 300;
            addChild(back);
        }
    }
}

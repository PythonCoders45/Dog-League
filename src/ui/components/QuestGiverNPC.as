package ui.components {
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import game.Game;

    public class QuestGiverNPC extends Sprite {
        private var questId:String;

        public function QuestGiverNPC(questId:String) {
            this.questId = questId;

            graphics.beginFill(0xFFD700);
            graphics.drawCircle(0, 0, 25);
            graphics.endFill();

            buttonMode = true;

            addEventListener(MouseEvent.CLICK, function():void {
                Game.instance.quests.startQuest(questId);
                Game.instance.screens.show("QuestLogScreen");
            });
        }
    }
}

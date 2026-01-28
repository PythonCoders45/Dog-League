package ui.layout {
    import flash.display.DisplayObject;
    import flash.display.Stage;

    public class UILayout {
        public static function centerX(obj:DisplayObject, stage:Stage):void {
            obj.x = (stage.stageWidth - obj.width) / 2;
        }

        public static function centerY(obj:DisplayObject, stage:Stage):void {
            obj.y = (stage.stageHeight - obj.height) / 2;
        }

        public static function center(obj:DisplayObject, stage:Stage):void {
            centerX(obj, stage);
            centerY(obj, stage);
        }

        public static function alignLeft(obj:DisplayObject, margin:int = 20):void {
            obj.x = margin;
        }

        public static function alignRight(obj:DisplayObject, stage:Stage, margin:int = 20):void {
            obj.x = stage.stageWidth - obj.width - margin;
        }

        public static function alignTop(obj:DisplayObject, margin:int = 20):void {
            obj.y = margin;
        }

        public static function alignBottom(obj:DisplayObject, stage:Stage, margin:int = 20):void {
            obj.y = stage.stageHeight - obj.height - margin;
        }
    }
}

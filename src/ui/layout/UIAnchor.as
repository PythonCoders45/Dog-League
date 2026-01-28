package ui.layout {
    import flash.display.DisplayObject;
    import flash.display.Stage;

    public class UIAnchor {
        public static function topLeft(obj:DisplayObject, margin:int = 20):void {
            obj.x = margin;
            obj.y = margin;
        }

        public static function topRight(obj:DisplayObject, stage:Stage, margin:int = 20):void {
            obj.x = stage.stageWidth - obj.width - margin;
            obj.y = margin;
        }

        public static function bottomLeft(obj:DisplayObject, stage:Stage, margin:int = 20):void {
            obj.x = margin;
            obj.y = stage.stageHeight - obj.height - margin;
        }

        public static function bottomRight(obj:DisplayObject, stage:Stage, margin:int = 20):void {
            obj.x = stage.stageWidth - obj.width - margin;
            obj.y = stage.stageHeight - obj.height - margin;
        }
    }
}

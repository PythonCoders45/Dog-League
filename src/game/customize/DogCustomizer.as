package game.customize {
    import game.Game;

    public class DogCustomizer {
        public static function applyColor(color:String, callback:Function):void {
            Game.instance.api.updateMyDog({ color: color }, callback);
        }

        public static function applyHat(hat:String, callback:Function):void {
            Game.instance.api.updateMyDog({ hat: hat }, callback);
        }

        public static function applyAccessory(acc:String, callback:Function):void {
            Game.instance.api.updateMyDog({ accessory: acc }, callback);
        }
    }
}

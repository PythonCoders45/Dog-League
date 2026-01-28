package game.items {
    import game.Game;

    public class ItemActions {
        public static function use(item:Object, callback:Function):void {
            switch(item.type) {
                case "food":
                    feedDog(item, callback);
                    break;
                case "toy":
                    playWithDog(item, callback);
                    break;
                case "buff":
                    applyBuff(item, callback);
                    break;
            }
        }

        private static function feedDog(item:Object, callback:Function):void {
            Game.instance.api.updateMyDog({ hunger: -20 }, callback);
        }

        private static function playWithDog(item:Object, callback:Function):void {
            Game.instance.api.updateMyDog({ mood: +20 }, callback);
        }

        private static function applyBuff(item:Object, callback:Function):void {
            Game.instance.api.updateMyDog({ energy: +30 }, callback);
        }
    }
}

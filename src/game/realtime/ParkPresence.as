package game.realtime {
    import game.Game;

    public class ParkPresence {
        public var players:Object = {};

        public function update(callback:Function):void {
            Game.instance.api.getChat(1, function(res:ApiResponse):void {
                if (res.ok()) {
                    callback(res.data);
                }
            });
        }
    }
}

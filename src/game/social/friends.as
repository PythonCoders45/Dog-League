package game.social {
    import flash.net.SharedObject;
    import flash.utils.getTimer;

    public class friends {
        // ============================
        // INTERNAL STORAGE
        // ============================

        private var store:SharedObject;

        // friend objects:
        // { username: "Bob", online: true }
        public var list:Array = [];

        // friend requests:
        // { from: "Alice" }
        public var requests:Array = [];

        // ============================
        // CONSTRUCTOR
        // ============================

        public function friends() {
            store = SharedObject.getLocal("friends_data");

            if (!store.data.list) store.data.list = [];
            if (!store.data.requests) store.data.requests = [];

            list = store.data.list;
            requests = store.data.requests;
        }

        // ============================
        // SAVE TO DISK
        // ============================

        private function save():void {
            store.data.list = list;
            store.data.requests = requests;
            store.flush();
        }

        // ============================
        // SEND FRIEND REQUEST
        // ============================

        public function sendRequest(username:String):Boolean {
            // Already friends?
            if (isFriend(username)) return false;

            // Already requested?
            if (hasRequestFrom(username)) return false;

            // Add request
            requests.push({ from: username });
            save();
            return true;
        }

        // ============================
        // ACCEPT REQUEST
        // ============================

        public function acceptRequest(from:String):Boolean {
            if (!hasRequestFrom(from)) return false;

            // Remove request
            for (var i:int = 0; i < requests.length; i++) {
                if (requests[i].from == from) {
                    requests.splice(i, 1);
                    break;
                }
            }

            // Add to friend list
            list.push({ username: from, online: false });
            save();
            return true;
        }

        // ============================
        // DECLINE REQUEST
        // ============================

        public function declineRequest(from:String):Boolean {
            if (!hasRequestFrom(from)) return false;

            for (var i:int = 0; i < requests.length; i++) {
                if (requests[i].from == from) {
                    requests.splice(i, 1);
                    break;
                }
            }

            save();
            return true;
        }

        // ============================
        // REMOVE FRIEND
        // ============================

        public function removeFriend(username:String):Boolean {
            for (var i:int = 0; i < list.length; i++) {
                if (list[i].username == username) {
                    list.splice(i, 1);
                    save();
                    return true;
                }
            }
            return false;
        }

        // ============================
        // ONLINE STATUS SIMULATION
        // ============================

        public function updateOnlineStatus():void {
            // Simple simulation:
            // Every friend randomly toggles online/offline every few seconds.

            for each (var f:Object in list) {
                var r:Number = Math.random();
                if (r < 0.02) f.online = !f.online; // 2% chance to flip
            }

            save();
        }

        // ============================
        // CHECKS
        // ============================

        public function isFriend(username:String):Boolean {
            for each (var f:Object in list) {
                if (f.username == username) return true;
            }
            return false;
        }

        public function hasRequestFrom(username:String):Boolean {
            for each (var r:Object in requests) {
                if (r.from == username) return true;
            }
            return false;
        }
    }
}

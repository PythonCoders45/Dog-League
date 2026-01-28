package net {
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;

    public class ApiClient {
        private var baseUrl:String;
        private var token:String = null;

        public function ApiClient(baseUrl:String) {
            this.baseUrl = baseUrl;
        }

        public function setToken(t:String):void {
            this.token = t;
        }

        private function sendRequest(
            endpoint:String,
            method:String,
            data:Object,
            callback:Function
        ):void {
            var req:URLRequest = new URLRequest(baseUrl + endpoint);
            req.method = method;

            var headers:Array = [];
            headers.push(new URLRequestHeader("Content-Type", "application/json"));

            if (token != null) {
                headers.push(new URLRequestHeader("Authorization", "Bearer " + token));
            }

            req.requestHeaders = headers;

            if (data != null) {
                req.data = JSON.stringify(data);
            }

            var loader:URLLoader = new URLLoader();

            loader.addEventListener(Event.COMPLETE, function(e:Event):void {
                var raw:String = loader.data;
                var parsed:Object;

                try {
                    parsed = JSON.parse(raw);
                } catch (err:Error) {
                    parsed = { error: "Invalid JSON response", raw: raw };
                }

                callback(new ApiResponse(parsed));
            });

            loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void {
                callback(new ApiResponse({ error: "IO Error: " + e.text }));
            });

            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(e:SecurityErrorEvent):void {
                callback(new ApiResponse({ error: "Security Error: " + e.text }));
            });

            loader.load(req);
        }

        // ============================
        // AUTH
        // ============================

        public function register(username:String, email:String, password:String, callback:Function):void {
            sendRequest("/auth/register", "POST", {
                username: username,
                email: email,
                password: password
            }, callback);
        }

        public function login(username:String, password:String, callback:Function):void {
            sendRequest("/auth/login", "POST", {
                username: username,
                password: password
            }, function(res:ApiResponse):void {
                if (res.data && res.data.access_token) {
                    setToken(res.data.access_token);
                }
                callback(res);
            });
        }

        // ============================
        // DOG
        // ============================

        public function getMyDog(callback:Function):void {
            sendRequest("/dogs/me", "GET", null, callback);
        }

        public function updateMyDog(data:Object, callback:Function):void {
            sendRequest("/dogs/me", "PATCH", data, callback);
        }

        // ============================
        // ITEMS + INVENTORY
        // ============================

        public function listItems(callback:Function):void {
            sendRequest("/items", "GET", null, callback);
        }

        public function getInventory(callback:Function):void {
            sendRequest("/inventory", "GET", null, callback);
        }

        public function addInventoryItem(itemId:int, qty:int, callback:Function):void {
            sendRequest("/inventory/add", "POST", {
                item_id: itemId,
                quantity: qty
            }, callback);
        }

        // ============================
        // PARKS
        // ============================

        public function listParks(callback:Function):void {
            sendRequest("/parks", "GET", null, callback);
        }

        public function joinPark(parkId:int, callback:Function):void {
            sendRequest("/parks/" + parkId + "/join", "POST", null, callback);
        }

        public function leavePark(parkId:int, callback:Function):void {
            sendRequest("/parks/" + parkId + "/leave", "POST", null, callback);
        }

        public function sendChat(parkId:int, msg:String, callback:Function):void {
            sendRequest("/parks/" + parkId + "/chat", "POST", { message: msg }, callback);
        }

        public function getChat(parkId:int, callback:Function):void {
            sendRequest("/parks/" + parkId + "/chat", "GET", null, callback);
        }

        // ============================
        // FLUFFIES
        // ============================

        public function createFluffy(name:String, species:String, color:String, callback:Function):void {
            sendRequest("/fluffies", "POST", {
                name: name,
                species: species,
                color: color
            }, callback);
        }

        public function listFluffies(callback:Function):void {
            sendRequest("/fluffies", "GET", null, callback);
        }

        // ============================
        // ACTIVITIES
        // ============================

        public function startActivity(type:String, callback:Function):void {
            sendRequest("/activities/start", "POST", { activity_type: type }, callback);
        }

        public function endActivity(id:int, callback:Function):void {
            sendRequest("/activities/" + id + "/end", "POST", null, callback);
        }
    }
}

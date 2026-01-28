package game.housing {
    import flash.net.SharedObject;

    public class HousingSystem {
        // ============================
        // PERSISTENT STORAGE
        // ============================

        private var store:SharedObject;

        // Core house data
        public var owner:String;
        public var theme:String = "default";      // Part 23
        public var yardEnabled:Boolean = false;   // Part 24

        // Furniture:
        // { id, x, y, rotation, area } area = "indoor" | "yard"
        public var furniture:Array = [];

        // Visitors (local simulation)
        // { username }
        public var visitors:Array = [];

        // ============================
        // CONSTRUCTOR
        // ============================

        public function HousingSystem(owner:String) {
            this.owner = owner;

            store = SharedObject.getLocal("housing_" + owner);

            if (store.data.theme) theme = store.data.theme;
            if (store.data.yardEnabled != null) yardEnabled = store.data.yardEnabled;
            if (store.data.furniture) furniture = store.data.furniture;
            if (store.data.visitors) visitors = store.data.visitors;
        }

        // ============================
        // SAVE
        // ============================

        public function save():void {
            store.data.theme = theme;
            store.data.yardEnabled = yardEnabled;
            store.data.furniture = furniture;
            store.data.visitors = visitors;
            store.flush();
        }

        // ============================
        // PART 22: ROTATION + GRID
        // ============================

        public function addFurniture(id:String, x:Number, y:Number, area:String = "indoor"):void {
            var snapped:Object = snapToGrid(x, y);
            furniture.push({
                id: id,
                x: snapped.x,
                y: snapped.y,
                rotation: 0,
                area: area
            });
            save();
        }

        public function moveFurniture(index:int, x:Number, y:Number):void {
            if (index < 0 || index >= furniture.length) return;
            var snapped:Object = snapToGrid(x, y);
            furniture[index].x = snapped.x;
            furniture[index].y = snapped.y;
            save();
        }

        public function rotateFurniture(index:int, delta:int = 90):void {
            if (index < 0 || index >= furniture.length) return;
            var f:Object = furniture[index];
            f.rotation = (f.rotation + delta) % 360;
            save();
        }

        private function snapToGrid(x:Number, y:Number, gridSize:int = 20):Object {
            var gx:Number = Math.round(x / gridSize) * gridSize;
            var gy:Number = Math.round(y / gridSize) * gridSize;
            return { x: gx, y: gy };
        }

        // ============================
        // PART 23: THEMES
        // ============================

        public function setTheme(id:String):void {
            // You can define valid themes elsewhere; here we just accept any string.
            theme = id;
            save();
        }

        public function getBackgroundImage():String {
            return "assets/houses/" + theme + ".png";
        }

        // ============================
        // PART 24: YARD SUPPORT
        // ============================

        public function enableYard():void {
            yardEnabled = true;
            save();
        }

        public function disableYard():void {
            yardEnabled = false;

            // Optionally move yard furniture indoors or remove it.
            for (var i:int = furniture.length - 1; i >= 0; i--) {
                if (furniture[i].area == "yard") {
                    furniture.splice(i, 1);
                }
            }

            save();
        }

        public function setFurnitureArea(index:int, area:String):void {
            if (index < 0 || index >= furniture.length) return;
            if (area != "indoor" && area != "yard") return;
            furniture[index].area = area;
            save();
        }

        public function getFurnitureForArea(area:String):Array {
            var arr:Array = [];
            for each (var f:Object in furniture) {
                if (f.area == area) arr.push(f);
            }
            return arr;
        }

        // ============================
        // PART 25: VISITORS
        // ============================

        public function addVisitor(username:String):void {
            if (hasVisitor(username)) return;
            visitors.push({ username: username });
            save();
        }

        public function removeVisitor(username:String):void {
            for (var i:int = 0; i < visitors.length; i++) {
                if (visitors[i].username == username) {
                    visitors.splice(i, 1);
                    break;
                }
            }
            save();
        }

        public function clearVisitors():void {
            visitors = [];
            save();
        }

        public function hasVisitor(username:String):Boolean {
            for each (var v:Object in visitors) {
                if (v.username == username) return true;
            }
            return false;
        }
    }
}

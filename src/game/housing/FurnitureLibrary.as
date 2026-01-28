package game.housing {
    public class FurnitureLibrary {
        public static function all():Array {
            return [
                { id: "bed1", name: "Dog Bed", image: "assets/furniture/bed1.png" },
                { id: "bowl1", name: "Food Bowl", image: "assets/furniture/bowl1.png" },
                { id: "plant1", name: "Plant", image: "assets/furniture/plant1.png" },
                { id: "rug1", name: "Rug", image: "assets/furniture/rug1.png" },
                { id: "toybox1", name: "Toy Box", image: "assets/furniture/toybox1.png" }
            ];
        }

        public static function get(id:String):Object {
            for each (var f:Object in all()) {
                if (f.id == id) return f;
            }
            return null;
        }
    }
}

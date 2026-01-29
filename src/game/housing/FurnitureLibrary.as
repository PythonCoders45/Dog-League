package game.housing {
    public class FurnitureLibrary {
        public static function all():Array {
            return [
                { id: "bed1", name: "Dog Bed", image: "assets/furniture/bed1.png" },
                { id: "bowl1", name: "Food Bowl", image: "assets/furniture/bowl1.png" },
                { id: "plant1", name: "Plant", image: "assets/furniture/plant1.png" },
                { id: "rug1", name: "Rug", image: "assets/furniture/rug1.png" },
                { id: "toybox1", name: "Toy Box", image: "assets/furniture/toybox1.png" },
                { id: "carpet1", name: "Carpet", image: "assets/furniture/carpet1.png" },
                { id: "bone1", name: "Bone", image: "assets/furniture/bone1.png" },
                { id: "pictureframe1", name: "Picture Frame", image: "assets/furniture/pictureframe1.png" },
                { id: "slippers1", name: "Slippers", image: "assets/furniture/slippers.png" },
                { id: "table1", name: "Table", image: "assets/furniture/table1.png" },
                { id: "toliet1", name: "Toliet", image: "assets/furniture/toliet1.png" }
                { id: "toothbrushcup1", name: "Tooth Brush Cup", image: "assets/furniture/toothbrushcup1.png" },
                { id: "welcomemat1", name: "Welcome Mat", image: "assets/furniture/welcomemat1.png" },
                { id: "chair1", name: "Chair", image: "assets/furniture/chair1.png" },
                { id: "petbed1", name: "Pet Bed", image: "assets/furniture/petbed1.png" },
                { id: "bed1", name: "Bed", image: "assets/furniture/bed1.png" },
                { id: "bone1", name: "Bone", image: "assets/furniture/bone1.png" }
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

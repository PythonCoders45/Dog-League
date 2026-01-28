package game.housing {
    public class HouseData {
        public var owner:String;
        public var furniture:Array = [];
        public var background:String = "default_house";

        public function HouseData(owner:String) {
            this.owner = owner;
        }
    }
}

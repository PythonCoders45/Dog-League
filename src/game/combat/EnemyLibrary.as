package game.combat {
    public class EnemyLibrary {
        public static function randomEnemy(map:String):Object {
            var enemies:Object = {
                forest: [
                    { name: "Wild Fox", hp: 40, attack: 6 },
                    { name: "Forest Spirit", hp: 50, attack: 5 }
                ],
                beach: [
                    { name: "Crab", hp: 30, attack: 4 },
                    { name: "Sand Golem", hp: 60, attack: 7 }
                ],
                city: [
                    { name: "Stray Bot", hp: 45, attack: 6 }
                ],
                snow: [
                    { name: "Ice Wolf", hp: 55, attack: 7 }
                ]
            };

            var list:Array = enemies[map];
            return list[int(Math.random() * list.length)];
        }
    }
}

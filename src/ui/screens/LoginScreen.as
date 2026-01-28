package ui.screens {
    import ui.components.*;
    import game.Game;

    public class LoginScreen extends UIContainer {
        private var username:UITextInput;
        private var password:UITextInput;

        public function LoginScreen() {
            addChild(new UILabel("Login", 28)).y = 20;

            username = new UITextInput(250);
            username.y = 80;
            username.text = "username";
            addChild(username);

            password = new UITextInput(250, true);
            password.y = 130;
            password.text = "password";
            addChild(password);

            var loginBtn:UIButton = new UIButton("Login", onLogin);
            loginBtn.y = 180;
            addChild(loginBtn);

            var regBtn:UIButton = new UIButton("Register", function():void {
                Game.instance.screens.show("RegisterScreen");
            });
            regBtn.y = 230;
            addChild(regBtn);
        }

        private function onLogin():void {
            Game.instance.api.login(username.text, password.text, function(res:ApiResponse):void {
                if (res.ok()) {
                    Game.instance.screens.show("MainMenu");
                }
            });
        }
    }
}

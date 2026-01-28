package ui.screens {
    import ui.components.*;
    import game.Game;

    public class RegisterScreen extends UIContainer {
        private var username:UITextInput;
        private var email:UITextInput;
        private var password:UITextInput;

        public function RegisterScreen() {
            addChild(new UILabel("Register", 28)).y = 20;

            username = new UITextInput(250);
            username.y = 80;
            username.text = "username";
            addChild(username);

            email = new UITextInput(250);
            email.y = 130;
            email.text = "email";
            addChild(email);

            password = new UITextInput(250, true);
            password.y = 180;
            password.text = "password";
            addChild(password);

            var regBtn:UIButton = new UIButton("Create Account", onRegister);
            regBtn.y = 230;
            addChild(regBtn);

            var backBtn:UIButton = new UIButton("Back", function():void {
                Game.instance.screens.show("LoginScreen");
            });
            backBtn.y = 280;
            addChild(backBtn);
        }

        private function onRegister():void {
            Game.instance.api.register(username.text, email.text, password.text, function(res:ApiResponse):void {
                if (res.ok()) {
                    Game.instance.screens.show("LoginScreen");
                }
            });
        }
    }
}

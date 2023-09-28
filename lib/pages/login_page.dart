import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatefulWidget {
 LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FirebaseAuth auth;
  String _email="";
  String _password="";

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'En & Joy',
        onLogin: _login,
        onSignup: _signup,
        onSubmitAnimationCompleted: () {
          // Yükleme ekranı tamamlandığında yapılacak işlemler
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }

  Future<String?> _login(LoginData data) async {
    createUserandEmail();
    // Giriş yapma işlemleri burada gerçekleştirilir.
    // Kullanıcı adı ve şifreyi `data.name` ve `data.password` ile alabilirsiniz.
    // Başarılı bir şekilde giriş yapılırsa `null` dönmelisiniz, aksi halde bir hata mesajı dönebilirsiniz.
    return null;
  }

  Future<String?> _signup(SignupData data) async {
    loginUserandEmail();
    // Kayıt olma işlemleri burada gerçekleştirilir.
    // Kullanıcı adı ve şifreyi `data.name` ve `data.password` ile alabilirsiniz.
    // Başarılı bir şekilde kayıt olunursa `null` dönmelisiniz, aksi halde bir hata mesajı dönebilirsiniz.
    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    // Şifre sıfırlama işlemleri burada gerçekleştirilir.
    // Kullanıcı adını `name` ile alabilirsiniz.
    // Şifre sıfırlama işlemi başarılı olursa `null` dönmelisiniz, aksi halde bir hata mesajı dönebilirsiniz.
    return null;
  }
  void createUserandEmail()async{
  try{
  var _userCrential= auth.createUserWithEmailAndPassword(email: _email, password: _password);

  debugPrint(_userCrential.toString());
  }catch(e){
    debugPrint(e.toString());
  }

}
  void loginUserandEmail()async{
    try{
      var _userCrential=await auth.signInWithEmailAndPassword(email: _email, password: _password);
      debugPrint(_userCrential.toString());
    }catch(e){
      debugPrint(e.toString());

    }

  }
}

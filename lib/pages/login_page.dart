import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: ' En & Joy',
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
    // Giriş yapma işlemleri burada gerçekleştirilir.
    // Kullanıcı adı ve şifreyi `data.name` ve `data.password` ile alabilirsiniz.
    // Başarılı bir şekilde giriş yapılırsa `null` dönmelisiniz, aksi halde bir hata mesajı dönebilirsiniz.
    return null;
  }

Future<String?> _signup(SignupData data) async {
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
}
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Login de la App
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 199, 223, 235),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/logo.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Ingresa tus datos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "email",
              "Correo UCAB",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "El correo no puede estar vacío.";
                }
                return null;
              },
              (onSavedVal) {
                email = onSavedVal;
              },
              prefixIcon: const Icon(Icons.email_outlined),
              showPrefixIcon: true,
              backgroundColor: Colors.white,
              borderFocusColor: Colors.green,
              prefixIconColor: Colors.green,
              borderColor: Colors.green,
              textColor: Colors.grey,
              hintColor: Colors.grey.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "password",
              "Contraseña",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "La contraseña no puede estar vacía.";
                }
                return null;
              },
              (onSavedVal) {
                password = onSavedVal;
              },
              prefixIcon: const Icon(Icons.lock_outlined),
              showPrefixIcon: true,
              backgroundColor: Colors.white,
              borderFocusColor: Colors.green,
              prefixIconColor: Colors.green,
              borderColor: Colors.green,
              textColor: Colors.grey,
              hintColor: Colors.grey.withOpacity(0.7),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.grey.withOpacity(0.7),
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text(
                    '¿Olvidó la contraseña?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          FormHelper.submitButton(
            "Inicia Sesión",
            () {
              Navigator.pushNamed(context, '/tripPage');
            },
            btnColor: Colors.green,
            borderColor: Colors.white,
            txtColor: Colors.white,
            borderRadius: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '¿No estas registrado?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Registrate',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

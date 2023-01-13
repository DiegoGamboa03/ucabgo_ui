import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Login de la App
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66bcd5b8),
                  Color(0x99bcd5b8),
                  Color(0xccbcd5b8),
                  Color(0xffbcd5b8),
                ]),
          ),
          child: ProgressHUD(
            child: Form(
              key: globalFormKey,
              child: _loginUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/logo.png',
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Ingresa contraseña nueva',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ]),
                  height: 50,
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
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  showPrefixIcon: true,
                  prefixIconPaddingLeft: 20,
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
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility)),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ]),
                  height: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormHelper.inputFieldWidget(
                  context,
                  "confirmPassword",
                  "Confirma la Contraseña",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "La contraseña no puede estar vacía.";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    password = onSavedVal;
                  },
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  showPrefixIcon: true,
                  prefixIconPaddingLeft: 20,
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
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility)),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
            height: 50,
            child: FormHelper.submitButton(
              "Guardar Contraseña",
              () {
                if (validateAndSave()) {
                  Navigator.pushNamed(context, '/');
                }
              },
              height: 60,
              width: 250,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              btnColor: Colors.green,
              borderColor: Colors.green,
              txtColor: Colors.white,
              borderRadius: 15,
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

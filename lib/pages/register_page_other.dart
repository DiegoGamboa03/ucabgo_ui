import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Registro de la App si el rol es Profesor o Trabajador
class RegisterPageOther extends StatefulWidget {
  const RegisterPageOther({super.key});

  @override
  _RegisterPageOtherState createState() => _RegisterPageOtherState();
}

class _RegisterPageOtherState extends State<RegisterPageOther> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? phoneNumber;
  String? twitter;
  String? instagram;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 199, 223, 235),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
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
              'Registra tus datos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "phoneNumber",
              "Número de Teléfono",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "El número de teléfono no puede estar vacío.";
                }
                return null;
              },
              (onSavedVal) {
                phoneNumber = onSavedVal;
              },
              prefixIcon: const Icon(Icons.phone_outlined),
              showPrefixIcon: true,
              prefixIconPaddingLeft: 20,
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
              "twitter",
              "Twitter",
              (onValidateVal) {},
              (onSavedVal) {
                twitter = onSavedVal;
              },
              prefixIcon: const Icon(Icons.alternate_email_outlined),
              showPrefixIcon: true,
              prefixIconPaddingLeft: 20,
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
              "instagram",
              "Instagram",
              (onValidateVal) {},
              (onSavedVal) {
                instagram = onSavedVal;
              },
              prefixIcon: const Icon(Icons.camera_alt_outlined),
              showPrefixIcon: true,
              prefixIconPaddingLeft: 20,
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
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: FormHelper.submitButton(
                  "Volver",
                  () {
                    Navigator.pushNamed(context, '/register');
                  },
                  height: 60,
                  width: 150,
                  btnColor: Colors.green,
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: FormHelper.submitButton(
                  "Registrate",
                  () {
                    Navigator.pushNamed(context, '/');
                  },
                  height: 60,
                  width: 150,
                  btnColor: Colors.green,
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '¿Ya estas registrado?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text(
                    'Inicia Sesión',
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

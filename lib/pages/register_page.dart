import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Login de la App
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? age;
  String? role;
  String? gender;
  String? phoneNumber;
  String? major;
  String? semester;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 53, 57, 182),
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
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "username",
              "Nombre de Usuario",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "El nombre de usuario no puede estar vacío.";
                }
                return null;
              },
              (onSavedVal) {
                username = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
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
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "age",
              "Edad",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "La edad no puede estar vacía.";
                }
                return null;
              },
              (onSavedVal) {
                age = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "gender",
              "Género",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "El género no puede estar vacío.";
                }
                return null;
              },
              (onSavedVal) {
                gender = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
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
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "major",
              "Carrera",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "La carrera no puede estar vacía.";
                }
                return null;
              },
              (onSavedVal) {
                major = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "semester",
              "Semestre",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "El semestre no puede estar vacío.";
                }
                return null;
              },
              (onSavedVal) {
                age = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
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
              borderFocusColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 5,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility)),
            ),
          ),
          FormHelper.submitButton(
            "Registrate",
            () {
              Navigator.pushNamed(context, '/');
            },
            btnColor: Color.fromARGB(255, 53, 57, 182),
            borderColor: Colors.white,
            txtColor: Colors.white,
            borderRadius: 5,
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

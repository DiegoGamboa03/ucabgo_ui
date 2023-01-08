import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Registro de la App
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
  List<dynamic> roles = [
    {"id": 1, "rol": "Estudiante"},
    {"id": 2, "rol": "Profesor"},
    {"id": 3, "rol": "Trabajador"}
  ];
  List<dynamic> genders = [
    {"id": 1, "gender": "Maculino"},
    {"id": 2, "gender": "Femenino"},
    {"id": 3, "gender": "Otro"}
  ];

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
              prefixIcon: const Icon(Icons.person_outline),
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
              prefixIcon: const Icon(Icons.accessibility_outlined),
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
            padding: const EdgeInsets.only(
                left: 30.0, top: 10.0, bottom: 10.0, right: 30.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: FormHelper.dropDownWidget(
                context,
                "Rol en la institución",
                role,
                roles,
                (onChangedVal) {
                  role = onChangedVal;
                },
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "El rol no puede estar vacío.";
                  }
                  return null;
                },
                paddingLeft: 0,
                paddingRight: 0,
                prefixIcon: const Icon(Icons.business_outlined),
                showPrefixIcon: true,
                prefixIconPaddingLeft: 20,
                borderFocusColor: Colors.green,
                prefixIconColor: Colors.green,
                borderColor: Colors.green,
                borderRadius: 10,
                optionValue: "id",
                optionLabel: "rol",
                textColor: Colors.grey,
                hintColor: Colors.grey.withOpacity(0.7),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, top: 10.0, bottom: 10.0, right: 30.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: FormHelper.dropDownWidget(
                context,
                "Género",
                gender,
                genders,
                (onChangedVal) {
                  gender = onChangedVal;
                },
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "El género no puede estar vacío.";
                  }
                  return null;
                },
                paddingLeft: 0,
                paddingRight: 0,
                prefixIcon: const Icon(Icons.groups_outlined),
                showPrefixIcon: true,
                prefixIconPaddingLeft: 20,
                borderFocusColor: Colors.green,
                prefixIconColor: Colors.green,
                borderColor: Colors.green,
                borderRadius: 10,
                optionValue: "id",
                optionLabel: "gender",
                textColor: Colors.grey,
                hintColor: Colors.grey.withOpacity(0.7),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: FormHelper.submitButton(
                  "Siguiente",
                  () {
                    if (role == "1") {
                      Navigator.pushNamed(context, '/registerStudent');
                    } else {
                      Navigator.pushNamed(context, '/registerOther');
                    }
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
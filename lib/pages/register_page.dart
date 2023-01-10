import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: _registerUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
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
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ],
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
                  initialValue: username ?? "",
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
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
                  initialValue: email ?? "",
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
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
            ],
          ),
          Stack(children: [
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
                initialValue: age ?? "",
                fontSize: 30,
                hintFontSize: 25,
                paddingLeft: 0,
                paddingRight: 0,
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
                isNumeric: true,
              ),
            ),
          ]),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  height: 48,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormHelper.dropDownWidget(
                  context,
                  "Rol en la institución",
                  role,
                  roles,
                  (onChangedVal) {
                    role = onChangedVal;
                  },
                  (onValidateVal) {
                    if (role == null) {
                      return "El rol no puede estar vacío.";
                    }
                    return null;
                  },
                  hintFontSize: 20,
                  paddingLeft: 0,
                  paddingRight: 0,
                  textColor: Colors.grey,
                  hintColor: Colors.grey.withOpacity(0.7),
                  prefixIcon: const Icon(Icons.business_outlined),
                  showPrefixIcon: true,
                  prefixIconPaddingLeft: 20,
                  borderFocusColor: Colors.green,
                  prefixIconColor: Colors.green,
                  borderColor: Colors.green,
                  borderRadius: 10,
                  optionValue: "id",
                  optionLabel: "rol",
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  height: 48,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormHelper.dropDownWidget(
                  context,
                  "Género",
                  gender,
                  genders,
                  (onChangedVal) {
                    gender = onChangedVal;
                  },
                  (onValidateVal) {
                    if (role == null) {
                      return "El género no puede estar vacío.";
                    }
                    return null;
                  },
                  hintFontSize: 20,
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ]),
                  height: 50,
                  child: FormHelper.submitButton(
                    "Siguiente",
                    () {
                      if (role == "1") {
                        if (validateAndSave()) {
                          Navigator.pushNamed(context, '/registerStudent');
                        }
                      } else {
                        if (validateAndSave()) {
                          Navigator.pushNamed(context, '/registerOther');
                        }
                      }
                    },
                    height: 60,
                    width: 150,
                    fontSize: 24,
                    btnColor: Colors.green,
                    borderColor: Colors.green,
                    txtColor: Colors.white,
                    borderRadius: 15,
                  ),
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
                  fontSize: 18,
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
                      fontSize: 18,
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

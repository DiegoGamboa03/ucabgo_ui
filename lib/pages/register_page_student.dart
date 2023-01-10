import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:google_fonts/google_fonts.dart';

///Registro de la App si el rol es estudiante
class RegisterPageStudent extends StatefulWidget {
  const RegisterPageStudent({super.key});

  @override
  _RegisterPageStudentState createState() => _RegisterPageStudentState();
}

class _RegisterPageStudentState extends State<RegisterPageStudent> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? phoneNumber;
  String? major;
  String? semester;
  String? twitter;
  String? instagram;
  String? password;

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
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
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
                  isNumeric: true,
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
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
                  prefixIcon: const Icon(Icons.work_outlined),
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
                  "semester",
                  "Semestre",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "El semestre no puede estar vacío.";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    semester = onSavedVal;
                  },
                  initialValue: semester ?? "",
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
                  prefixIcon: const Icon(Icons.business_outlined),
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
                  "twitter",
                  "Twitter",
                  (onValidateVal) {},
                  (onSavedVal) {
                    twitter = onSavedVal;
                  },
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
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
                  "instagram",
                  "Instagram",
                  (onValidateVal) {},
                  (onSavedVal) {
                    instagram = onSavedVal;
                  },
                  fontSize: 30,
                  hintFontSize: 25,
                  paddingLeft: 0,
                  paddingRight: 0,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
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
                    "Volver",
                    () {
                      Navigator.pushNamed(context, '/register');
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
                    "Registrate",
                    () {
                      if (validateAndSave()) {
                        Navigator.pushNamed(context, '/');
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

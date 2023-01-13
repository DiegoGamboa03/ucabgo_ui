import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Registro de la App si el rol es Profesor o Trabajador
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? age;
  String? role;
  String? gender;
  String? phoneNumber;
  String? twitter;
  String? instagram;
  String? password;

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
        appBar: AppBar(
          backgroundColor: Color(0xffbcd5b8),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profilePage');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            "Perfil",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
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
              child: _editProfileUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget _editProfileUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'images/icono_app.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xffbcd5b8)),
                        child: const Icon(Icons.edit_outlined)),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Edita tus datos',
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
                  decoration: const BoxDecoration(boxShadow: [
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
                  (onValidateVal) {},
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
                  decoration: const BoxDecoration(boxShadow: [
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
                  (onValidateVal) {},
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
                decoration: const BoxDecoration(boxShadow: [
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
                "date",
                "Fecha de Nacimiento",
                (onValidateVal) {},
                (onSavedVal) {
                  age = onSavedVal;
                },
                initialValue: age ?? "",
                fontSize: 30,
                hintFontSize: 25,
                paddingLeft: 0,
                paddingRight: 0,
                prefixIcon: const Icon(Icons.calendar_today_outlined),
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 6.0, bottom: 6.0),
              child: TextField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2004),
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2100),
                  );
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate!);
                  setState(() {
                    age = formattedDate.toString();
                  });
                },
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
                  (onValidateVal) {},
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
                  (onValidateVal) {},
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
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
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
                  (onValidateVal) {},
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
                  decoration: const BoxDecoration(boxShadow: [
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
                  decoration: const BoxDecoration(boxShadow: [
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
                  decoration: const BoxDecoration(boxShadow: [
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
                  (onValidateVal) {},
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ]),
                  height: 50,
                  child: FormHelper.submitButton(
                    "Salvar",
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

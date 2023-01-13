import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

///Registro de la App si el rol es Profesor o Trabajador
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              Navigator.pushNamed(context, '/');
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
              child: _profileUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget _profileUI(BuildContext context) {
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
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Tus datos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
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
                      "Editar Perfil",
                      () {
                        Navigator.pushNamed(context, '/editProfilePage');
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
          ]),
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

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/controllers/auth_controller.dart';
import 'package:flutter_application_2/app/modules/login/views/login_view.dart';
import 'package:flutter_application_2/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter_application_2/app/modules/verifikasi/views/verifikasi_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  final AuthController authController = Get.find<AuthController>();
  final SignupController signupController = Get.put(SignupController());
  // String _username = '';
  TextEditingController _usernameController =
      TextEditingController(); // Controller for username TextField

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _register() {
    String username =
        _usernameController.text; // Get value from username TextField
    _sendVerificationEmail(username); // Send verification email
  }

  void _sendVerificationEmail(String username) {
    // Here, you should implement your logic to send verification email
    // For example, you can use an email service provider like Firebase Authentication
    // Or you can use your own backend service to send emails
    // Once the email is sent successfully, navigate to the verification page
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => VerifikasiView(username: username)),
    );
  }

  @override

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Container(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         decoration: BoxDecoration(),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Image.asset("../assets/logo.png"),
  //             SizedBox(
  //               height: 0,
  //             ),
  //             SizedBox(
  //               height: 30,
  //             ),
  //             Container(
  //               height: 400,
  //               width: 360,
  //               decoration: BoxDecoration(
  //                 color: Color.fromARGB(255, 219, 238, 255),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   Text(
  //                     'Register',
  //                     style: TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       color: Color.fromARGB(255, 58, 123, 176),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Container(
  //                     width: 290,
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                         labelText: 'Full Name',
  //                         labelStyle: TextStyle(
  //                             fontSize: 12,
  //                             color: Color.fromARGB(255, 61, 124, 175)),
  //                         prefixIcon: Icon(
  //                           Icons.person_pin,
  //                           color: const Color.fromARGB(255, 52, 120, 175),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: 290,
  //                     child: TextField(
  //                       controller: _usernameController,
  //                       decoration: InputDecoration(
  //                           labelText: 'Username',
  //                           labelStyle: TextStyle(
  //                               fontSize: 12,
  //                               color: const Color.fromARGB(255, 60, 123, 175)),
  //                           prefixIcon: Icon(Icons.person_pin,
  //                               color: Color.fromARGB(255, 69, 128, 176))),
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _username = value;
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Container(
  //                     width: 290,
  //                     child: TextField(
  //                       obscureText: _isObscure,
  //                       decoration: InputDecoration(
  //                           labelText: 'Password',
  //                           labelStyle: TextStyle(
  //                               fontSize: 12,
  //                               color: const Color.fromARGB(255, 60, 123, 175)),
  //                           prefixIcon: Icon(
  //                             Icons.lock,
  //                             color: const Color.fromARGB(255, 64, 126, 176),
  //                           ),
  //                           suffixIcon: IconButton(
  //                             icon: Icon(_isObscure
  //                                 ? Icons.visibility
  //                                 : Icons.visibility_off),
  //                             onPressed: _togglePasswordVisibility,
  //                             color: const Color.fromARGB(255, 64, 126, 176),
  //                           )),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: 290,
  //                     child: TextField(
  //                       obscureText: _isObscure,
  //                       decoration: InputDecoration(
  //                           labelText: 'Confirm Password',
  //                           labelStyle: TextStyle(
  //                             fontSize: 12,
  //                             color: const Color.fromARGB(255, 70, 129, 176),
  //                           ),
  //                           prefixIcon: Icon(
  //                             Icons.lock,
  //                             color: const Color.fromARGB(255, 59, 123, 175),
  //                           ),
  //                           suffixIcon: IconButton(
  //                             icon: Icon(_isObscure
  //                                 ? Icons.visibility
  //                                 : Icons.visibility_off),
  //                             onPressed: _togglePasswordVisibility,
  //                             color: const Color.fromARGB(255, 62, 124, 176),
  //                           )),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   GestureDetector(
  //                     onTap: _register,
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       width: 300,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(50),
  //                         color: Color.fromARGB(255, 55, 121, 176),
  //                       ),
  //                       child: Padding(
  //                         padding: EdgeInsets.all(10.0),
  //                         child: Text(
  //                           'Register',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 15,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 9,
  //                   ),
  //                   Text(
  //                     'Already have an account',
  //                     style: TextStyle(
  //                       color: Color.fromARGB(255, 54, 121, 175),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 0,
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(builder: (context) => LoginPage()),
  //                       );
  //                     },
  //                     child: Text(
  //                       'Login here!',
  //                       style: TextStyle(
  //                         color: Color.fromARGB(255, 59, 123, 176),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset("../assets/logo.png"),
          SizedBox(
            height: 0,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 400,
            width: 360,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 238, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 58, 123, 176),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 290,
                  child: TextField(
                    controller: signupController.emailC,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 61, 124, 175)),
                      prefixIcon: Icon(
                        Icons.person_pin,
                        color: const Color.fromARGB(255, 52, 120, 175),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 290,
                  child: TextField(
                    controller: signupController.passC,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 60, 123, 175)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: const Color.fromARGB(255, 64, 126, 176),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: _togglePasswordVisibility,
                          color: const Color.fromARGB(255, 64, 126, 176),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () => authController.signup(
                      signupController.emailC.text,
                      signupController.passC.text),
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 55, 121, 176),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  'Already have an account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 54, 121, 175),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login here!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 59, 123, 176),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}

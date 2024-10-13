import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Tambahkan ini untuk Firebase Authentication
import 'package:tugas_8/Pages/login_page.dart';
import 'package:tugas_8/app/theme/app_color.dart';
import 'package:tugas_8/custom/widget/custom_box_image.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _registerWithEmailPassword() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password dan Konfirmasi Password tidak cocok")),
      );
      return;
    }
    
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pendaftaran Berhasil!")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Pendaftaran Gagal")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 352,
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Images/Register.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),

              CustomTextFormField(
                label: 'Masukkan Email',
                controller: _emailController,
              ),
              CustomTextFormField(
                label: 'Password',
                controller: _passwordController,
                obscureText: true,
              ),
              CustomTextFormField(
                label: 'Konfirmasi Password',
                controller: _confirmPasswordController,
                obscureText: true,
              ),

              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color(0xff3498DB),
                  ),
                  onPressed: _registerWithEmailPassword, 
                  child: Text('Mendaftar', style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xffc0c0c0),
                      height: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Atau Daftar Menggunakan', style: TextStyle(color: Color(0xffc0c0c0)),),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xffc0c0c0),
                      height: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: whiteColor,
                  ),
                  onPressed: () {}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Images/ggl.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Google', 
                        style: TextStyle(
                          color: Colors.red, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 49,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah Punya Akun? Silahkan '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) => LoginPage()
                    ),
                  );
                    },
                    child: Text('masuk', style: TextStyle(color: Color(0xff3498db))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(
            label, 
            style: TextStyle(
              color: Color(0xffC0C0C0),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC0C0C0)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RxBool _isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDFDFF),
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
                      image: AssetImage('assets/Images/loginbg.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                label: 'Masukkan Email',
                controller: _emailController,
              ),
              Obx(
                () => CustomTextFormField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      _isPasswordVisible.value = !_isPasswordVisible.value;
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Tambahkan logika untuk reset password
                    },
                    child: Text('Lupa Password?'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Obx(() {
                if (loginController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color(0xff3498DB),
                    ),
                    onPressed: () {
                      loginController.loginWithEmailPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                if (loginController.errorMessage.value.isNotEmpty) {
                  return Text(
                    loginController.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  );
                }
                return SizedBox.shrink();
              }),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum Punya Akun? Silahkan '),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/register'); // Navigasi ke halaman register
                    },
                    child: Text(
                      'Mendaftar ',
                      style: TextStyle(color: Color(0xff3498db)),
                    ),
                  ),
                  Text('Sekarang'),
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
    this.suffixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;

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
            style: TextStyle(color: Color(0xffC0C0C0)),
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC0C0C0)),
          ),
        ),
      ),
    );
  }
}

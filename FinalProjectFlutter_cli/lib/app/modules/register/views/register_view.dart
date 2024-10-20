import 'package:finalprojectflut_cli/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController registerController = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Variabel untuk mengontrol visibilitas password
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isConfirmPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDFDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Container(
                    width: 352,
                    height: 330,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Images/regisbg.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  controller: _emailController,
                  label: "Masukkan Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                Obx(() => CustomTextFormField(
                  controller: _passwordController,
                  label: "Password",
                  obscureText: !_isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      _isPasswordVisible.value = !_isPasswordVisible.value;
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                )),
                Obx(() => CustomTextFormField(
                  controller: _confirmPasswordController,
                  label: "Konfirmasi Password",
                  obscureText: !_isConfirmPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      _isConfirmPasswordVisible.value = !_isConfirmPasswordVisible.value;
                    },
                  ),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Password tidak cocok';
                    }
                    return null;
                  },
                )),
                SizedBox(height: 20),
                Obx(() {
                  if (registerController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerController.register(
                          _emailController.text,
                          _passwordController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color(0xff3498DB),
                      minimumSize: Size(double.infinity, 52),
                    ),
                    child: Text(
                      'Mendaftar',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
                SizedBox(height: 20),
                Obx(() {
                  if (registerController.errorMessage.value.isNotEmpty) {
                    return Text(
                      registerController.errorMessage.value,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  }
                  return SizedBox.shrink();
                }),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Sudah punya akun? silahkan ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'masuk',
                          style: TextStyle(color: Color(0xff3498DB)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed('/login'); // Navigasi ke halaman Login
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xffC0C0C0)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC0C0C0)),
          ),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}

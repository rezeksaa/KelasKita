import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kelas_kita/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF232323),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Silakan isi untuk membuat akun pada aplikasi kami',
                style: TextStyle(fontSize: 16, color: Color(0xFF8B8B8B)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildTextField(
                controller: _nameController,
                hintText: 'Nama Lengkap',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: _obscurePassword,
                isPassword: true,
                onToggleObscure: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                obscure: _obscurePassword,
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kata sandi harus 8 karakter',
                  style: TextStyle(fontSize: 14, color: Color(0xFF8B8B8B)),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B9B8F),
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Daftar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah mempunyai akun? ',
                    style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFFFC700),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Atau hubungkan',
                  style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 15),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton(
                    icon: FontAwesomeIcons.facebookF,
                    color: const Color(0xFF1877F3),
                    onTap: () {},
                  ),
                  const SizedBox(width: 24),
                  _socialButton(
                    icon: FontAwesomeIcons.instagram,
                    color: const Color(0xFFF56040),
                    onTap: () {},
                  ),
                  const SizedBox(width: 24),
                  _socialButton(
                    icon: FontAwesomeIcons.twitter,
                    color: const Color(0xFF1DA1F2),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onToggleObscure,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF8B8B8B),
                  ),
                  onPressed: onToggleObscure,
                )
                : null,
      ),
      style: const TextStyle(fontSize: 16, color: Color(0xFF232323)),
    );
  }
}

Widget _socialButton({
  required IconData icon,
  required Color color,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      radius: 28,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 32),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/widgets/little_textfield.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_outlined_button.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late bool showSignIn = false;
  late bool showSignUp = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/app-images/account_background.jpg'),
          fit: BoxFit.cover),
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'N\na\nv\na',
                  style: TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Vaughan',
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 0.7,
                  ),
                ),
                const SizedBox(height: 30),
                PersonalizedOutlinedButton(
                  text: 'Sign in',
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  onPressed: () {
                    setState(() {
                      showSignIn = true;
                      showSignUp = false;
                      emailController.text = "";
                      passwordController.text = "";
                      confirmPasswordController.text = "";
                    });
                  },
                ),
                const SizedBox(height: 10),
                PersonalizedElevatedButton(
                  color: Theme.of(context).colorScheme.secondary,
                  text: 'Sign up',
                  onPressed: () {
                    setState(() {
                      showSignIn = false;
                      showSignUp = true;
                      emailController.text = "";
                      confirmPasswordController.text = "";
                      passwordController.text = "";
                    });
                  },
                ),
                const SizedBox(height: 30),
                if (showSignIn) _buildSignInForm(),
                if (showSignUp) _buildSignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        LittleTextField(hintText: 'Email', controller: emailController, color: Theme.of(context).colorScheme.surfaceContainerHighest),
        const SizedBox(height: 15),
        LittleTextField(
          hintText: 'Contraseña',
          obscureText: true,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          controller: passwordController,
        ),
        const SizedBox(height: 10),
        PersonalizedOutlinedButton(
          foregroundColor: Theme.of(context).colorScheme.surface,
          text: 'Enviar',
          onPressed: () => _handleSignIn(emailController, passwordController),
        ),
      ],
    );
  }

  Widget _buildSignupForm() {
    return Column(
      children: [
        LittleTextField(hintText: 'Email', controller: emailController, color: Theme.of(context).colorScheme.surfaceContainerHighest),
        const SizedBox(height: 15),
        LittleTextField(
          hintText: 'Contraseña',
          obscureText: true,
          controller: passwordController,
          color: Theme.of(context).colorScheme.surfaceContainerHighest
        ),
        const SizedBox(height: 15),
        LittleTextField(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          hintText: 'Reingrese la contraseña',
          obscureText: true,
          controller: confirmPasswordController,
        ),
        const SizedBox(height: 15),
        PersonalizedOutlinedButton(
          foregroundColor: Theme.of(context).colorScheme.surface,
          text: 'Enviar',
          onPressed: () => _handleSignUp(emailController, passwordController, confirmPasswordController),
        ),
      ],
    );
  }

  void _handleSignIn(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Por favor ingrese el email y la contraseña");
      return;
    }

    if (userSignIns.any(
      (user) => user.email == email && user.password == password,
    )) {
      Fluttertoast.showToast(msg: "Ingreso exitoso");
      GoRouter.of(context).go('/home', extra: email);
    } else {
      Fluttertoast.showToast(msg: "Email o contraseña no válidos");
    }
  }

  void _handleSignUp(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
  ) {
    String email = emailController.text;
    String password = passwordController.text;
    String password2 = confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || password2.isEmpty) {
      Fluttertoast.showToast(msg: "Por favor ingrese el email y ambas contraseñas");
      return;
    } else if (password != password2) {
      Fluttertoast.showToast(msg: "Las contraseñas no coinciden");
      return;
    } else if (!userSignIns.any((user) => user.email == email)) {
      userSignIns.add(UserSignInfo(email: email, password: password));
      GoRouter.of(context).go('/home', extra: email);
      Fluttertoast.showToast(msg: "Ingreso exitoso");
    } else {
      Fluttertoast.showToast(msg: "El email ya está en uso");
    }
  }
}

class UserSignInfo {
  final String email;
  final String password;
  UserSignInfo({required this.email, required this.password});
}

List<UserSignInfo> userSignIns = [
  UserSignInfo(email: 'jorge@gmail', password: '123456'),
];

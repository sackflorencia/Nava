import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/widgets/little_textfield.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_outlined_button.dart';
import 'package:nava/src/widgets/personalized_text_button.dart';

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
  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/app-images/account_background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Text(
                  'N\na\nv\na',
                  style: TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Vaughan',
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 0.7,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0, left: 20.0, right:20.0),
                child: Column(
                  children: [
                    if (!showSignIn && !showSignUp) _buildAccountButtons(),
                    const SizedBox(height: 30),
                    if (showSignIn) _buildSignInForm(),
                    if (showSignUp) _buildSignupForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountButtons() {
    return Column(
      children: [
        PersonalizedOutlinedButton(
          text: 'Sign in',
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          onPressed: () {
            setState(() {
              showSignIn = true;
              showSignUp = false;
              emailController.text = "";
              passwordController.text = "";
              confirmPasswordController.text = "";
              usernameController.text = "";
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
              usernameController.text = "";
            });
          },
        ),
      ],
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        LittleTextField(
          hintText: 'Email o username',
          controller: emailController,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 10),
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
        const SizedBox(height: 10),
        PersonalizedTextButton(
          text: 'Nuevo en Nava? Sign up',
          color: Theme.of(context).colorScheme.surface,
          onPressed: () {
            setState(() {
              showSignIn = false;
              showSignUp = true;
              emailController.text = "";
              confirmPasswordController.text = "";
              passwordController.text = "";
              usernameController.text = "";
            });
          },
        ),
      ],
    );
  }

  Widget _buildSignupForm() {
    return Column(
      children: [
        LittleTextField(
          hintText: 'Email',
          controller: emailController,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 10),
        LittleTextField(
          hintText: 'Username',
          controller: usernameController,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 10),
        LittleTextField(
          hintText: 'Contraseña',
          obscureText: true,
          controller: passwordController,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 10),
        LittleTextField(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          hintText: 'Reingrese la contraseña',
          obscureText: true,
          controller: confirmPasswordController,
        ),
        const SizedBox(height: 10),
        PersonalizedOutlinedButton(
          foregroundColor: Theme.of(context).colorScheme.surface,
          text: 'Enviar',
          onPressed: () => _handleSignUp(
            emailController,
            passwordController,
            confirmPasswordController,
            usernameController,
          ),
        ),
        const SizedBox(height: 10),
        PersonalizedTextButton(
          text: 'Ya tenés una cuenta? Sign in',
          color: Theme.of(context).colorScheme.onSurface,
          onPressed: () {
            setState(() {
              showSignIn = true;
              showSignUp = false;
              emailController.text = "";
              passwordController.text = "";
              confirmPasswordController.text = "";
              usernameController.text = "";
            });
          },
        ),
      ],
    );
  }

  void _handleSignIn(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    String account = emailController.text;
    String password = passwordController.text;

    if (account.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Por favor ingrese el email y la contraseña");
      return;
    }

    if (userSignIns.any(
      (user) =>
          user.email == account ||
          user.username == account && user.password == password,
    )) {
      Fluttertoast.showToast(msg: "Ingreso exitoso");
      GoRouter.of(context).go('/home', extra: account);
    } else {
      Fluttertoast.showToast(msg: "Email o contraseña no válidos");
    }
  }

  void _handleSignUp(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    TextEditingController usernameController,
  ) {
    String email = emailController.text;
    String password = passwordController.text;
    String password2 = confirmPasswordController.text;
    String username = usernameController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        password2.isEmpty ||
        username.isEmpty) {
      Fluttertoast.showToast(
        msg: "Por favor ingrese el email, el username y ambas contraseñas",
      );
      return;
    } else if (password != password2) {
      Fluttertoast.showToast(msg: "Las contraseñas no coinciden");
      return;
    } else if (!userSignIns.any(
      (user) =>
          user.email == email &&
          !userSignIns.any((user) => user.username == username),
    )) {
      userSignIns.add(
        UserSignInfo(email: email, password: password, username: username),
      );
      GoRouter.of(context).go('/home', extra: email);
      Fluttertoast.showToast(msg: "Ingreso exitoso");
    } else {
      Fluttertoast.showToast(msg: "El email o el username ya están en uso");
    }
  }
}

class UserSignInfo {
  final String email;
  final String password;
  final String username;
  UserSignInfo({
    required this.email,
    required this.password,
    required this.username,
  });
}

List<UserSignInfo> userSignIns = [
  UserSignInfo(email: 'jorge@gmail', password: '123456', username: 'jorgeh'),
];

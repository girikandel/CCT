import 'package:flutter/material.dart';
import 'package:message_app/custom_field_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const Text(
                "Sign Up Here,",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFieldWidget(
                      label: "Name",
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFieldWidget(
                      label: "Email",
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a message";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFieldWidget(
                      controller: passwordController,
                      obsecureText: true,
                      label: "Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Signup Successful"),
                            ),
                          );
                        }
                      },
                      child: const Text("SignUp"),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginPage()));
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

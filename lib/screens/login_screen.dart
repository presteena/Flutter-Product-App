// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'product_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          // Centers the entire box in the screen
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: 350, // Set a fixed width for better alignment
            decoration: BoxDecoration(
              color: Colors.blueGrey[100], // Light grey background
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26, // Soft shadow
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents full height stretch
              crossAxisAlignment: CrossAxisAlignment.center, // Centers text
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24, // Larger text
                    fontWeight: FontWeight.bold, // Bold for emphasis
                    color: Color.fromARGB(255, 9, 130, 229),
                  ),
                ),
                const SizedBox(height: 20), // Space below the heading
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns fields properly
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration:
                            const InputDecoration(labelText: "Username"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username must not be empty.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password must not be empty.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        // Center the login button
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);
                              bool isAuthenticated = authProvider.login(
                                _usernameController.text,
                                _passwordController.text,
                              );

                              if (isAuthenticated) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ProductListScreen()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Invalid username or password")),
                                );
                              }
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
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

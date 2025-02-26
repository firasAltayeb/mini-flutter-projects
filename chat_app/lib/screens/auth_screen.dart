import 'dart:io';

import 'package:chat_app/constants.dart';
import 'package:chat_app/theme_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../widgets/user_image_picker.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _firebase = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _enteredUsername = '';
  String _enteredPassword = '';
  String _enteredEmail = '';
  bool _isAuthenticating = false;
  bool _isLoginPage = true;
  File? _selectedImage;

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("The provided form details are not valid")),
      );
    } else {
      _formKey.currentState!.save();
      setState(() => _isAuthenticating = true);
      try {
        if (_isLoginPage) {
          final userCredentials = await _firebase.signInWithEmailAndPassword(
              email: _enteredEmail, password: _enteredPassword);
          debugPrint("userCredentials $userCredentials");
        } else {
          final userCredentials =
              await _firebase.createUserWithEmailAndPassword(
                  email: _enteredEmail, password: _enteredPassword);
          final storageRef = FirebaseStorage.instance
              .ref() // gives access to firebase cloud storage
              .child(Constants.userImagesKey)
              .child('${userCredentials.user!.uid}.jpg');
          String imageUrl = '';
          if (_selectedImage != null) {
            await storageRef.putFile(_selectedImage!);
            imageUrl = await storageRef.getDownloadURL();
          }
          await FirebaseFirestore.instance
              .collection(Constants.usersKey)
              .doc(userCredentials.user!.uid)
              .set({
            Constants.userNameKey: _enteredUsername,
            Constants.emailKey: _enteredEmail,
            Constants.userImageKey: imageUrl,
          });
        }
      } on FirebaseAuthException catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message ?? "Authentication failed."),
            ),
          );
        }
      } catch (e) {
        debugPrint("caught exception $e");
      } finally {
        if (mounted) {
          setState(() => _isAuthenticating = false);
        }
      }
    }
  }

  Widget _buildTextField({
    required String label,
    bool obscureText = false,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      autocorrect: false,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/chat.png', width: 100),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!_isLoginPage) ...[
                          UserImagePicker(
                            onPickImage: (img) => _selectedImage = img,
                          ),
                          _buildTextField(
                            label: 'User name',
                            validator: (v) => (v == null || v.trim().length < 4)
                                ? 'User name must contain at least 4 characters.'
                                : null,
                            onSaved: (v) => _enteredUsername = v!,
                          ),
                        ],
                        _buildTextField(
                          label: 'Email',
                          validator: (v) => (v == null ||
                                  v.trim().isEmpty ||
                                  !v.contains('@'))
                              ? 'Please enter a valid email address.'
                              : null,
                          onSaved: (v) => _enteredEmail = v!,
                        ),
                        _buildTextField(
                          label: 'Password',
                          obscureText: true,
                          validator: (v) => (v == null || v.trim().length < 6)
                              ? 'Password must be 6 characters long'
                              : null,
                          onSaved: (v) => _enteredPassword = v!,
                        ),
                        const SizedBox(height: 25),
                        if (!_isAuthenticating) ...[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.primaryContainerColor,
                            ),
                            onPressed: _submit,
                            child: Text(_isLoginPage ? 'Login' : 'Signup'),
                          ),
                          TextButton(
                            onPressed: () =>
                                setState(() => _isLoginPage = !_isLoginPage),
                            child: Text(
                              _isLoginPage
                                  ? 'Create an account'
                                  : 'I already have an account',
                            ),
                          ),
                        ] else
                          const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

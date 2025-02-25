import 'package:chat_app/theme_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/user_image_picker.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  File? _selectedImage;
  var _enteredUsername = '';
  var _enteredPassword = '';
  var _enteredEmail = '';
  var _isLogin = true;
  var _isAuthenticating = false;

  void _submit() async {
    if (!_form.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("The provided form details are not valid")),
      );
    } else {
      _form.currentState!.save();
      setState(() => _isAuthenticating = true);
      try {
        if (_isLogin) {
          final userCredentials = await _firebase.signInWithEmailAndPassword(
              email: _enteredEmail, password: _enteredPassword);
          print("userCredentials $userCredentials");
        } else {
          final userCredentials =
              await _firebase.createUserWithEmailAndPassword(
                  email: _enteredEmail, password: _enteredPassword);
          final storageRef = FirebaseStorage.instance
              .ref() // gives access to firebase cloud storage
              .child('user_images') // child targets or creates a new path
              .child('${userCredentials.user!.uid}.jpg');
          String imageUrl = '';
          if (_selectedImage != null) {
            await storageRef.putFile(_selectedImage!);
            imageUrl = await storageRef.getDownloadURL();
          }
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredentials.user!.uid)
              .set({
            'username': _enteredUsername,
            'email': _enteredEmail,
            'image_url': imageUrl,
          });
        }
      } on FirebaseAuthException catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.message ?? "Authentication failed."),
          ));
        }
      } catch (e) {
        print("caught exception $e");
      } finally {
        if (mounted) {
          setState(() => _isAuthenticating = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: 100,
                child: Image.asset(
                  'assets/images/chat.png',
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin) ...[
                            UserImagePicker(
                              onPickImage: (pickedImage) {
                                _selectedImage = pickedImage;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                              ),
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null || value.trim().length < 4) {
                                  return 'username must contain at least 4 character.';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredUsername = newValue!;
                              },
                            ),
                          ],
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredEmail = newValue!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be 6 characters long';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredPassword = newValue!;
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          if (_isAuthenticating)
                            const CircularProgressIndicator(),
                          if (!_isAuthenticating) ...[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.primaryContainerColor,
                              ),
                              onPressed: _submit,
                              child: Text(
                                _isLogin ? 'Login' : 'Signup',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? 'Create an account'
                                    : 'I already have an account',
                              ),
                            )
                          ],
                        ],
                      ),
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

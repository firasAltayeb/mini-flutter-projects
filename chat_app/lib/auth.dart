import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredPassword = '';
  var _enteredEmail = '';
  var _isLogin = true;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    try {
      if (_isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        //...
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.message ?? "Authentication failed.",
            ),
          ),
        );
      }
      print("error $error");
    } catch (e) {
      print("caught exception $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                width: 200,
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
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
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

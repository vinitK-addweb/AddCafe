import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:addcafe/Providers/apis/UserAuth.dart';

class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({super.key});

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context, listen: true);
    return Container(
      child: Card(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter current password',
                        labelStyle: TextStyle(fontSize: 20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter new password',
                        labelStyle: TextStyle(fontSize: 20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      // else if (passwordController.text !=
                      //     confirmPasswordController.text) {
                      //   return 'Password mismatch';
                      // }
                      else {
                        return null;
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                        var Responsesdljf = userAuth.changePassword({
                          "email": "addweb@addweb.com",
                          "old_password": passwordController.text,
                          "new_password": confirmPasswordController.text
                        });
                        passwordController.text = '';
                        confirmPasswordController.text = '';
                      }
                    },
                    child: const Text('Change password'),
                  ),
                  Container(
                    child: Text(userAuth.isPasswordUpdated),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

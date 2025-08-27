
import 'package:flutter/material.dart';

import '../../../common_widgets/text_form_field.dart';
import '../../../generated/l10n.dart';
import 'controller/signin_controller.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
  //  final s = S.of(context);
   // final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignInController(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    SizedBox(height: 50),
                    Text(
                      "SignIn ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 18),
                    Consumer<SignInController>(
                      builder: (context, provider, child) {
                        return Form(
                          key: provider.formKey,
                          child: Column(
                            children: [
                              TextFormFieldWidget(
                                labelText: 'Email',
                                hintText: 'Enter your email address',
                                prefixIcon: Icons.email,
                                validator: (String? p1)=>provider.emailValidator(p1),
                                controller: provider.controllerEmail,
                              ),
                              SizedBox(height: 18),
                              TextFormFieldWidget(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: Icons.password,
                                showTextField: true,
                                validator: (String? p1) =>provider.passwordValidator(p1),
                                controller: provider.controllerPassword,
                              ),
                              SizedBox(height: 18),
                              ElevatedButton(onPressed: ()=>provider.signIntoApp(context), child: Text("Sign In"))
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

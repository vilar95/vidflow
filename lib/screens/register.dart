import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/custom_field.dart';
import 'package:vidflow/controller/register_controller.dart';
import 'package:vidflow/screens/login.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegisterController registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueVoid,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Ink(
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Image.asset(
                        AppImages.registerImage,
                        height: 160,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Image.asset(
                        AppImages.logo,
                        height: 28,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blueAccent,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: Text("Insira seus dados para criar sua conta."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomField(
                          label: "Nome", textController: registerController.textUserController),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomField(
                          label: "Email", textController: registerController.textEmailController),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomField(
                          label: "Senha",
                          textController: registerController.textPasswordController),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: CustomButton(
                              onTap: () {
                                registerController.register();
                                Get.offAll(() => Login(), transition: Transition.leftToRight);
                              },
                              text: "Cadastrar",
                              icon: Icons.login),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          "Já possui uma conta?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          onPressed: () => Get.to(() => Login()),
                          child: Text(
                            "Faça seu login!",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.blueAccent,
                              decorationColor: AppColors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    )
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

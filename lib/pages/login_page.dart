import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:projeto_ford/components/form_component.dart';
import 'package:projeto_ford/components/page_wrapper_component.dart';
import 'package:projeto_ford/components/text_field_component.dart';

class LoginPage extends StatelessWidget {
  static const LOGIN_PAGE_ROUTE = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapperComponent(
      onWillPopupBehavior: true,
      childComponent: Center(
        child: FormComponent(
          title: 'Cadastre-se',
          formFields: [
            TextFieldComponent(
              label: 'Nome',
              validator: ValidationBuilder(localeName: 'pt-br')
                  .required()
                  .minLength(5)
                  .build(),
            ),
            TextFieldComponent(
              label: 'Email',
              validator: ValidationBuilder(localeName: 'pt-br')
                  .required()
                  .email('Email inválido')
                  .build(),
              margin: const EdgeInsets.only(top: 16),
            ),
            TextFieldComponent(
              label: 'Senha',
              validator:
                  ValidationBuilder(localeName: 'pt-br').required().build(),
              margin: const EdgeInsets.only(top: 16),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}

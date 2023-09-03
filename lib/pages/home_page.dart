import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:projeto_ford/components/custom_app_bar_component.dart';
import 'package:projeto_ford/components/form_component.dart';
import 'package:projeto_ford/components/page_wrapper_component.dart';
import 'package:projeto_ford/components/text_field_component.dart';

class HomePage extends StatefulWidget {
  static const HOME_PAGE_ROUTE = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapperComponent(
      onWillPopupBehavior: true,
      appBar: CustomAppBarComponent(
        title: 'teste',
      ),
      childComponent: Center(
        child: FormComponent(
          title: 'teste',
          formFields: [
            TextFieldComponent(
              validator:
                  ValidationBuilder(localeName: 'pt-br').required().build(),
              margin: const EdgeInsets.only(bottom: 16),
              label: 'teste',
            ),
            TextFieldComponent(
              validator: ValidationBuilder(localeName: 'pt-br').email().build(),
              label: 'teste',
            ),
          ],
        ),
      ),
    );
  }
}

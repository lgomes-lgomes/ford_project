import 'package:flutter/material.dart';
import 'package:projeto_ford/common/enums/form_direction_enum.dart';
import 'package:projeto_ford/common/style/app_colors.dart';
import 'package:projeto_ford/common/style/app_fonts.dart';
import 'package:projeto_ford/common/style/app_spacings.dart';
import 'package:projeto_ford/pages/home_page.dart';

class FormComponent extends StatefulWidget {
  FormComponent({
    super.key,
    required this.formFields,
    this.formDirection = FormDirectionEnum.vertical,
    required this.title,
    this.centerTitle = true,
  });

  List<StatelessWidget> formFields;
  FormDirectionEnum? formDirection;
  String title;
  bool centerTitle;

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacings.padding_lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.centerTitle
              ? Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: AppFontSizes.font_size_lg,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: AppFontSizes.font_size_lg,
                  ),
                  textAlign: TextAlign.center,
                ),
          const SizedBox(
            height: 16,
          ),
          Form(
            key: _formKey,
            child: widget.formDirection == FormDirectionEnum.vertical
                ? Column(
                    children: widget.formFields,
                  )
                : Row(
                    children: widget.formFields,
                  ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => _formKey.currentState!.validate()
                  ? Navigator.pushNamed(context, HomePage.HOME_PAGE_ROUTE)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                  AppColors.PRIMARY_COLOR,
                ),
              ),
              child: const Text('cadastrar'),
            ),
          ),
        ],
      ),
    );
  }
}

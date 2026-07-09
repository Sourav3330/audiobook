import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/validators.dart';
import 'common_text_form_field.dart';

/// Email-tuned wrapper around [CommonTextFormField] — email keyboard, no
/// auto-capitalisation, deny-whitespace formatter, default email validator.
class CommonEmailField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String hintText;
  final String? helperText;
  final String? errorText;

  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final Widget? prefixIcon;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Iterable<String>? autofillHints;

  const CommonEmailField({
    super.key,
    this.label = 'Email',
    this.controller,
    this.focusNode,
    this.hintText = 'name@company.com',
    this.helperText,
    this.errorText,
    this.validator,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      label: label,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      validator: validator ?? Validators.email,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      autofillHints: autofillHints,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      prefixIcon: prefixIcon,
    );
  }
}

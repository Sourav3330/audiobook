import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'common_text_form_field.dart';

/// Password input with a built-in obscure-text toggle (eye icon).
class CommonPasswordField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? hintText;
  final String? helperText;
  final String? errorText;

  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool autofocus;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  final Widget? prefixIcon;
  final bool initiallyObscured;
  final Iterable<String>? autofillHints;

  const CommonPasswordField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText,
    this.helperText,
    this.errorText,
    this.validator,
    this.textInputAction,
    this.enabled = true,
    this.autofocus = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.initiallyObscured = true,
    this.autofillHints,
  });

  @override
  State<CommonPasswordField> createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.initiallyObscured;
  }

  void _toggle() => setState(() => _obscured = !_obscured);

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      label: widget.label,
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: _obscured,
      autofillHints: widget.autofillHints,
      prefixIcon: widget.prefixIcon,
      suffixIcon: IconButton(
        tooltip: _obscured ? 'Show password' : 'Hide password',
        icon: Icon(
          _obscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          size: 20,
          color: AppColors.textSecondary,
        ),
        onPressed: _toggle,
      ),
    );
  }
}

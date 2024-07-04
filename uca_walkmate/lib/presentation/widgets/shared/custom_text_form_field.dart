import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.onChanged,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        label != null? Text(label!, style: textTheme.bodyMedium): const SizedBox.shrink(),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            border: const UnderlineInputBorder(),
            errorText: errorMessage,
          ),
        ),
      
      ],
    );
  }
}
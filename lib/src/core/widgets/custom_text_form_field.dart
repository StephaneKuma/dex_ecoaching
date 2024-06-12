import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    required this.prefixIcon,
    this.hasSuffix = false,
    this.readOnly = false,
    required this.label,
    this.controller,
    this.validator,
  });

  final TextInputType keyboardType;
  final Icon prefixIcon;
  final bool hasSuffix;
  final bool readOnly;
  final String label;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.hasSuffix;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey.shade700,
      keyboardType: widget.keyboardType,
      obscureText: _isObscured,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.label,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.hasSuffix
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: FaIcon(
                  _isObscured
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 15,
                  color: Colors.grey.shade800,
                ),
              )
            : const SizedBox(),
      ),
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}

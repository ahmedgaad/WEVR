import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class PaymentTextFormField extends StatelessWidget {
  PaymentTextFormField({
    super.key,
    required this.textEditingController,
    this.inputFormatters,
    required this.hintText,
    required this.prefixIcon,
    required this.onChanged,
    this.keyboardType, 
    this.suffix,
  });

  final TextEditingController textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final IconData prefixIcon;
  final Function(String) onChanged;
  String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType ?? TextInputType.number,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF8F8F9),
          hintStyle: const TextStyle(
            color: Color(0xFFB8B5C3),
          ),
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide.none),
          hintText: hintText,
          suffixIcon: suffix,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Icon(prefixIcon),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({Key? key, required this.height,this.controller,}) : super(key: key);
  final double height;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: TextFormField(
          // initialValue: StringsManager.searchBar.tr,
          keyboardType: TextInputType.text,
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onFieldSubmitted: (String text){},
        )
    );
  }
}
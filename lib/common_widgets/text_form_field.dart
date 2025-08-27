
import 'package:flutter/material.dart';
class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool showTextField ;
 final String? Function(String?)? validator;
 final TextEditingController controller ;
  const TextFormFieldWidget({super.key, required this.labelText, required this.hintText, required this.prefixIcon , this.showTextField =false,required this.validator, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: (value) => validator!(value),
      obscureText:showTextField ,
      decoration: InputDecoration(
        labelText:labelText.trim(),
        hintText: hintText.trim(),
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

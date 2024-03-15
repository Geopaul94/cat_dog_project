

import 'package:flutter/material.dart';

class FormCntainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? labelText;
  final String? hintText;
  final String? helperText;

  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  
  const FormCntainerWidget({super.key, 
    this.controller,
    this.fieldkey,
    this.isPasswordField,
    this.labelText,
    this.hintText,
    this.helperText,
    this.inputType,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator, required Null Function(dynamic value) onChanged, String? errorText, 
  });

  @override
  State<FormCntainerWidget> createState() => _FormCntainerWidgetState();
}

class _FormCntainerWidgetState extends State<FormCntainerWidget> {
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldkey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(

          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: widget.isPasswordField == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Colors.grey,
                  ),
                )
              : null, 
        ),
      ),
    );
  }
}

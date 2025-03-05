import 'package:flutter/material.dart';
import 'package:weather_app/core/colors/app_colors.dart';

class InputTextField extends StatelessWidget {

  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChange;
  final String? value;
  final TextEditingController? controller;

  const InputTextField({super.key,  this.label,this.hint, this.prefixIcon, this.onChange, this.value, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 12.0,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.inputTextFieldColor.withOpacity(0.9),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          label: Text(label!, style: TextStyle(
            color: Colors.white
          ),),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          border: InputBorder.none,
          prefixIcon: prefixIcon,
        ),
        onChanged: onChange,
        controller: controller,
        cursorColor: Colors.white.withOpacity(0.9),
      ),
    );
  }
}

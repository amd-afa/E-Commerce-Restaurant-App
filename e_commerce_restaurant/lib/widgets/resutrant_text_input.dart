import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:flutter/material.dart';

class ResturantTextField extends StatefulWidget {
  const ResturantTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.decoration,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.suffixWidget = const SizedBox(),
    this.maxLength,
    this.maxLines,
    this.contentPadding = 0,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration? decoration;
  final String? errorText;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? suffixWidget;
  final int? maxLength;
  final int? maxLines;
  final double contentPadding;
  final bool readOnly;

  @override
  ResturantTextFieldState createState() => ResturantTextFieldState();
}

class ResturantTextFieldState extends State<ResturantTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration ??
          InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.contentPadding, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade700,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lime.shade900,
                  width: 0.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.shade500,
                  width: 0.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade600,
                  width: 0.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              hintText: widget.hintText,
              errorText: widget.errorText,
              suffix: widget.suffixWidget,
              errorStyle: subtitleStyle(color: Colors.red.shade500),
              hintStyle: subtitleStyle(color: Colors.grey.shade500)),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style ?? subtitleStyle(color: Colors.lime.shade500),
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}

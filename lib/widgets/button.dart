import 'package:attendance/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? custom;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.custom = null});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: widget.custom == null
              ? Text(
                  widget.text,
                  style: onPrimaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                )
              : widget.custom!),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
            side: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(16),
          )),
          child: Text(
            text,
            style: blueTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )),
    );
  }
}

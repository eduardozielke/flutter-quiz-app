import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/themes/text_styles.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    Key? key,
    this.isLoading = false,
    required this.onPressed,
    this.textColor,
    required this.buttonText,
    this.disabled = false,
    this.style,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.width = double.infinity,
  }) : super(key: key);

  final String buttonText;
  final void Function()? onPressed;
  final Color? textColor;
  final bool isLoading;
  final bool disabled;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: disabled ? onPressed : null,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                buttonText,
                style: textColor != null
                    ? TextStyle(color: textColor)
                    : TextStyles.playAndNext,
              ),
      ),
    );
  }
}

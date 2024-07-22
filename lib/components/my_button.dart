import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor; // New parameter for border color

  const MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor, // Require borderColor
  });

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          color: isPressed ? widget.backgroundColor.withOpacity(0.8) : widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: widget.borderColor, width: 2), // Add border color
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

enum FieldType { username, email, password }

class ValidatedTextField extends StatefulWidget {
  final FieldType fieldType;
  final String label;
  final TextEditingController controller;

  const ValidatedTextField({
    super.key,
    required this.fieldType,
    required this.label,
    required this.controller,
  });

  @override
  State<ValidatedTextField> createState() => _ValidatedTextFieldState();
}

class _ValidatedTextFieldState extends State<ValidatedTextField> {
  bool isValid = false;
  bool obscureText = true;
  String passwordStrength = '';

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  void _validateInput() {
    final value = widget.controller.text;

    setState(() {
      switch (widget.fieldType) {
        case FieldType.username:
          isValid = value.isNotEmpty;
          break;
        case FieldType.email:
          isValid = value.contains('@');
          break;
        case FieldType.password:
          isValid = value.length >= 8;
          passwordStrength = _evaluatePassword(value);
          break;
      }
    });
  }

  String _evaluatePassword(String password) {
    if (password.length < 6) return 'Weak';
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (hasUpper &&
        hasLower &&
        hasDigit &&
        hasSpecial &&
        password.length >= 8) {
      return 'Strong';
    }
    return 'Medium';
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.fieldType == FieldType.password;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: const TextStyle(color: Colors.grey)),
          TextField(
            controller: widget.controller,
            obscureText: isPassword ? obscureText : false,
            decoration: InputDecoration(
              suffixIcon:
                  isPassword
                      ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (passwordStrength.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                passwordStrength,
                                style: TextStyle(
                                  color:
                                      passwordStrength == 'Strong'
                                          ? Colors.green
                                          : Colors.orange,
                                ),
                              ),
                            ),
                          IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                () =>
                                    setState(() => obscureText = !obscureText),
                          ),
                        ],
                      )
                      : Icon(
                        isValid ? Icons.check : Icons.close,
                        color: isValid ? Colors.green : Colors.red,
                      ),
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

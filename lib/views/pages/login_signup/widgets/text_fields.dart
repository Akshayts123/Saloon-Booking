

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final hint;
  final iconsdata;
  const TextFields({Key? key, this.hint, this.iconsdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
           decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconsdata),
            ),
          ),
        ),
      ),
    );
  }
}

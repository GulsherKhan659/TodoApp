import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? textController;
  final String? hintText;
  TextFieldWidget({Key? key, this.textController, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(),
      child: TextField(
        controller: textController,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(hintText: "Enter Todo $hintText"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class ErrorBox extends StatelessWidget {
  final String? message;
  const ErrorBox({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Eror BOX");
    print(message);
    if(message == null)
      return Container();
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.red,
      child: Row(children: [
        Icon(Icons.error_outline, color: Colors.white, size: 40,),
        SizedBox(width: 16,),
        Expanded(child: Text("Oops... $message, tente por favor novamente", style: TextStyle(color: Colors.white),),)

      ],),
    );
  }
}

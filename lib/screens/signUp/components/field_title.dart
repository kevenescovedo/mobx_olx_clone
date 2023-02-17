import 'package:flutter/material.dart';
class FieldTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const FieldTitle({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2,bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(" $title  ",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
          ),
          Text(" $subTitle ",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12,

            ),
          )
        ],
      ),
    );
  }
}

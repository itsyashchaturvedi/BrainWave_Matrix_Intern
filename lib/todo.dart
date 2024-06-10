import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final String title;
  final String desc;
  final bool done;
  const Todo({super.key, required this.title, required this.desc, required this.done});
  @override
  State<Todo> createState() => _TodoState();
}
class _TodoState extends State<Todo> {
  Color color=Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:Container(


          height: 80,
          decoration: BoxDecoration(
            color: widget.done?color=Colors.blueAccent:color=Colors.purple,
            borderRadius: BorderRadius.circular(15),
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(9, 11, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,style: const TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child : Text(widget.desc ,style: const TextStyle(color: Colors.white),),
            ),
          ]
          ),
        )
        ),
    );
  }
}

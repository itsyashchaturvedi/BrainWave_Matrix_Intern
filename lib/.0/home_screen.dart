import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_models.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModels> todos = [];
  TextEditingController title=TextEditingController();
  TextEditingController desc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todo List",style:TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.w800),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
       child : Column(
        children: [
          SizedBox(
            height: 430,
          child :ListView.builder(
              itemCount: todos.length,
              shrinkWrap: true,
              itemBuilder:(context,index)
          {
              return InkWell(
                onTap: (){
                  todos[index].check=!todos[index].check;
                  setState(() {

                  });
                },
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child:Todo(title: todos[index].title,desc: todos[index].desc,done: todos[index].check),
                    ),

                    IconButton(onPressed: (){
                      todos.removeAt(index);
                      setState(() {

                      });
                    },
                        icon:Icon(Icons.delete)
                    )
              ]),
              );
          }),
          ),
          Padding(
              padding: EdgeInsets.all(12.0),
          child : Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()
                ),
                child:Padding(
                  child : TextFormField(
                    controller: title,
                    decoration: InputDecoration(labelText:"Title"),
                  ),
                padding: EdgeInsets.all(12.0),
                )
              ),
              const SizedBox(
                height: 12
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all()
                  ),
                  child:Padding(
                    child : TextFormField(
                      controller: desc,
                      decoration: InputDecoration(labelText:"Description"),
                    ),
                    padding: EdgeInsets.all(12.0),
                  )
              ),
              const SizedBox(
                height: 2,
              ),
              IconButton(
                  iconSize: 50,
                  highlightColor: Colors.grey,
                  onPressed: (){
                    todos.add(TodoModels(title.text,desc.text,false));
                        setState(() {});
                  },
                  icon: Icon(Icons.add)
              ),
            ],
          )

    ),
        ],
      ),
    ),
    );
  }
}

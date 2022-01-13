import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:rest_api_ex/data/models/todo.dart';
import 'package:rest_api_ex/logic/todo_cubit/cubit/todo_cubit.dart';



class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);


  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final idController = TextEditingController();
  final todoController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 300.0,
          child: Column(
            children: [
              TextFormField(
                controller: idController,
                decoration: const InputDecoration(
                  hintText: 'Id',
                ),
              ),
              TextFormField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: 'Todo',
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Todo todo = Todo(
                        id: int.parse(idController.text),
                        todo: todoController.text,
                        description: descriptionController.text
                    );

                    context.read<TodoCubit>().addTodo(todo);
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_ex/data/models/todo.dart';
import 'package:rest_api_ex/logic/todo_cubit/cubit/todo_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final idController = TextEditingController();
  final todoController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, TodoState>(
        bloc: context.read<TodoCubit>()..fetchTodos(),
        builder: (context, state) {
          if (state is TodoInitial) {
            return const CircularProgressIndicator();
          } else if (state is TodoLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:130.0, left: 30, bottom: 80),
                  child: Row(
                    children: [
                      const Text('TODO APP',
                      style:  TextStyle(
                        fontSize: 40,
                        color: Colors.grey
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child:  ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(context: context, builder: (context) {return Container(
                                color: const Color(0xff04a3a3),
                                child: Center(
                                  child: SizedBox(
                                    width: 200.0,
                                    height: 300.0,
                                    child: Column(
                                      children: [
                                        const Text('Edit Todo',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white
                                          ),),
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
                                            style: ElevatedButton.styleFrom(primary: Colors.white),
                                            onPressed: () {
                                              Todo todo = Todo(
                                                id: int.parse(idController.text),
                                                todo: todoController.text,
                                                description: descriptionController.text,
                                                isDone: false,
                                              );

                                              context.read<TodoCubit>().addTodo(todo);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Submit',
                                              style: TextStyle(
                                                  color: Color(0xff04a3a3)
                                              ),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              });



                              //PLUS
                            },
                            child: const Icon(Icons.add, color: Colors.white, size: 35),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(0),
                              primary: const Color(0xff04a3a3),
                              onPrimary: Colors.blue,
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 517.8,
                  decoration: const BoxDecoration(
                    color: Color(0xff6cb4b1),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: ListTile(
                              title: Text(state.todoList[index].todo!,
                              style: const TextStyle(
                                fontSize: 22
                              ),),
                              subtitle: Text(state.todoList[index].description!),
                              trailing: ElevatedButton(
                                child: const Icon(Icons.check, color: Colors.white, size: 25),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0),
                                    primary:  state.todoList[index].isDone!? const Color(0xff32CD32) : const Color(0xffA0A0A0) ,
                                    onPrimary: Colors.blue,
                                  ),
                                  onPressed: () => context.read<TodoCubit>().doneTodo(state.todoList[index].id!, state.todoList[index].isDone!)
                              ),
                              onTap: (){
                                showModalBottomSheet(context: context, builder: (context){
                                  return Container(
                                    color: const Color(0xff04a3a3),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, left:88),
                                          child: Row(
                                            children: [
                                              Text(state.todoList[index].todo!,
                                              style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.white
                                            ),
                                              ),
                                            ],
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, left:80, right: 80),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(state.todoList[index].description!,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                  ),
                                                    textAlign: TextAlign.center
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                        Row(
                                          children: [
                                            //Done
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20, left:43, right: 10),
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      context.read<TodoCubit>().doneTodo(state.todoList[index].id!, state.todoList[index].isDone!);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Column(
                                                      children: const [
                                                        Icon(Icons.check, color: Colors.white, size:50),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 8.0),
                                                          child: Text('DONE',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 23
                                                          ),),
                                                        )
                                                      ],
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                      padding: const EdgeInsets.only(top:8, bottom:8, left: 18, right:18),
                                                      primary: const Color(0xff6cb4b1),
                                                      onPrimary: Colors.blue,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //EDIT
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20, left:4, right: 10),
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      showModalBottomSheet(context: context, builder: (context)

                                                      {return Container(
                                                          color: const Color(0xff04a3a3),
                                                          child: Center(
                                                            child: SizedBox(
                                                              width: 200.0,
                                                              height: 300.0,
                                                              child: Column(
                                                                children: [
                                                                  const Text('Edit Todo',
                                                                  style: TextStyle(
                                                                    fontSize: 20,
                                                                    color: Colors.white
                                                                  ),),
                                                                  // TextFormField(
                                                                  //   controller: idController,
                                                                  //   decoration: const InputDecoration(
                                                                  //     hintText: 'Id',
                                                                  //   ),
                                                                  // ),
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
                                                                      style: ElevatedButton.styleFrom(primary: Colors.white),
                                                                      onPressed: () {
                                                                        Todo todo = Todo(
                                                                            // id: int.parse(idController.text),
                                                                            todo: todoController.text,
                                                                            description: descriptionController.text
                                                                        );

                                                                        context.read<TodoCubit>().editTodo(state.todoList[index].id!, todo.todo!, todo.description!);
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: const Text('Submit',
                                                                      style: TextStyle(
                                                                        color: Color(0xff04a3a3)
                                                                      ),),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                    child: Column(
                                                      children: const [
                                                        Icon(Icons.edit, color: Colors.white, size:50),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 8.0),
                                                          child: Text('EDIT',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 23
                                                            ),),
                                                        )
                                                      ],
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                      padding: const EdgeInsets.only(top:8, bottom:8, left: 25, right:25),
                                                      primary: const Color(0xff6cb4b1),
                                                      onPrimary: Colors.blue,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //DELETE
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20, left:4),
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      showCupertinoDialog(builder: (BuildContext context) {
                                                        return CupertinoAlertDialog(
                                                            title: const Text('Are you sure you want to delete todo ?'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: (){
                                                                  Navigator.pop(context);
                                                                  },
                                                                child: const Text('No')),
                                                            TextButton(onPressed: (){
                                                              context.read<TodoCubit>().deleteTodo(state.todoList[index].id!);
                                                              Navigator.pop(context);
                                                              Navigator.pop(context);
                                                            }, child: const Text('Yes'))
                                                          ],

                                                        );
                                                        }, context: context);
                                                    },
                                                    child: Column(
                                                      children: const [
                                                        Icon(Icons.delete, color: Colors.white, size:50),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 8.0),
                                                          child: Text('DELETE',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 23
                                                            ),),
                                                        )
                                                      ],
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                      padding: const EdgeInsets.only(top:8, bottom:8, left: 10, right:10),
                                                      primary: const Color(0xff6cb4b1),
                                                      onPrimary: Colors.blue,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        );
                      },
                      itemCount: state.todoList.length,
                    ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text((state as TodoLoadingError).errorMessage),
            );
          }
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rest_api_ex/data/models/todo.dart';
import 'package:rest_api_ex/data/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final todoRepository = TodoRepository();

  Future<void> fetchTodos() async {
    emit(TodoInitial());
    try {
      var todoList = await todoRepository.fetchTodos();
      emit(TodoLoaded(todoList!));
    } catch (e) {
      emit(
        TodoLoadingError(e.toString()),
      );
    }
  }

  Future<void> deleteTodo(int id) async {
    emit(TodoInitial());
    try {
      await todoRepository.deleteTodo(id);
      fetchTodos();
    } catch (e) {
      emit(
        TodoLoadingError(e.toString()),
      );
    }
  }

  Future<void> addTodo(Todo todo) async {
    emit(TodoInitial());
    try {
      await todoRepository.addTodo(todo);
      fetchTodos();
    } catch (e) {
      emit(
        TodoLoadingError(e.toString()),
      );
    }
  }

  Future<void> doneTodo(int id, bool done) async {
    emit(TodoInitial());
    try {
      await todoRepository.doneTodo(id, done);
      fetchTodos();
    } catch (e) {
      emit(
        TodoLoadingError(e.toString()),

      );
    }
  }

  Future<void> editTodo(int id, String todo, String desc) async {
    emit(TodoInitial());
    try {
      await todoRepository.editTodo(id, todo, desc);
      fetchTodos();
    } catch (e) {
      emit(
        TodoLoadingError(e.toString()),

      );
    }
  }
}

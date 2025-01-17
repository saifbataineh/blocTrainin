import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        builder: (context, todos) {
          return ListView.builder(
              itemCount:todos.length ,
              itemBuilder: (context,index){
      final todo=todos[index];
      return ListTile(
        title: Text(todo.name),
      );
            });
        },
      ),
      appBar: AppBar(
        title: const Text("TODO List"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
        onPressed: () {
        Navigator.pushNamed(context, '/add-todo');
      }),
    );
  }
}

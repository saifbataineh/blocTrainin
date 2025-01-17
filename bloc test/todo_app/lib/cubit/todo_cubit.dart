



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);
  void addTodo(String title){
    if(title.isEmpty){
      addError('title cannot be empty');
    }
final todo=TodoModel(name: title, createdAt: DateTime.now());

emit([todo,...state]);

  }
  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    print('Todo change -$change');
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
   print('error todo cubit -$error');
    super.onError(error, stackTrace);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:todo_task_app/modal/todo_modal.dart';

class TodoProvider with ChangeNotifier {
  DateTime _date = DateTime.now();
  List<Todo> _todoLists = <Todo>[];

  ///This method is to get Date And Date Dialog Box
  showDate(BuildContext context) {
    return showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime(2050))
        .then((value) {
      this._date = value!;
      notifyListeners();
    });
  }

  String get date => DateFormat("dd-MM-yyyy").format(this._date).toString();
//////// Alert Dilog Box
  void alert(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 2,
            titlePadding:
                const EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 5),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alert",
                  style: TextStyle(color: Colors.red),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(25),
            content: Text("Text Box is Empty"),
          );
        });
  }

///////////////////////ToDo Handeler//////////////////////////////////////////
  List<Todo> get todoList => this._todoLists;

  void addToTodoList({required String title, required String description}) {
    Todo _todo = Todo(
      title: title,
      description: description,
      date: date,
    );
    _todoLists.add(_todo);
    notifyListeners();
  }

  void deleteTodoFromList({required int index}) {
    _todoLists.removeAt(index);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/screen/widgets/text_field.dart';
import 'package:todo_task_app/todoprovider/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoProvider>(context);
    final kwidth = MediaQuery.of(context).size.width / 1.4;
    print(todo.todoList);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFieldWidget(
                        textController: _titleController,
                        hintText: "Title",
                      ),
                      TextFieldWidget(
                        textController: _descriptionController,
                        hintText: "Description",
                      ),
                      Container(
                        width: kwidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(todo.date),
                            ElevatedButton(
                              onPressed: () => todo.showDate(context),
                              child: Text("Pick Date"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: kwidth,
                        child: ElevatedButton(
                          child: Text("Add Todo"),
                          onPressed: () {
                            final _titleText = _titleController.text;
                            final _descriptionText =
                                _descriptionController.text;
                            if (_titleText.isNotEmpty &&
                                _descriptionText.isNotEmpty) {
                              todo.addToTodoList(
                                  title: _titleText,
                                  description: _descriptionText);
                              _titleController.text = "";
                              _descriptionController.text = "";
                            } else {
                              todo.alert(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ))),
          Expanded(
              flex: 6,
              child: Container(
                color: Colors.blueAccent,
                child: ListView.builder(
                    itemCount: todo.todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        color: Colors.black,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${todo.todoList[index].title}"),
                                Text(
                                  "Date :${todo.todoList[index].date}",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            subtitle:
                                Text("${todo.todoList[index].description}"),
                            trailing: IconButton(
                              onPressed: () {
                                todo.deleteTodoFromList(index: index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )),
        ],
      ),
    );
  }
}

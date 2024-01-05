import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_task_dealersoft/controllers/task_controller.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer<TaskController>(
      builder: (BuildContext context, TaskController value, Widget? child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Provider.of<TaskController>(context, listen: false)
                    .setUserData(value.items[index]),
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 5),
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFE7F5FD),
                            shape: OvalBorder(),
                          ),
                          child: Center(
                              child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF76C6F5)),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              value.items[index].name.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "JCB KL99",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          size: 25,
                          Icons.chevron_right_outlined,
                          color: Colors.grey,
                        )
                      ]),
                ),
              );
            },
          ),
        );
      },
    ));
  }
}

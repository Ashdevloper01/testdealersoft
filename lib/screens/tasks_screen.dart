import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';
import 'package:system_task_dealersoft/controllers/task_controller.dart';
import 'package:system_task_dealersoft/screens/widgets/bottom_sheet.dart';
import 'package:system_task_dealersoft/screens/widgets/task_screen_widget.dart';
import 'package:system_task_dealersoft/utils/const.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: Color(0xFFF8D349),
            )),
        actions: [
          IconButton(
              onPressed: () {
                context.read<TaskController>().togglePlay();
              },
              icon: const Icon(
                Icons.play_circle,
                size: 44,
                color: Colors.green,
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(right: 45),
              height: 40,
              decoration: ShapeDecoration(
                color: ColorConstant.color1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const TextField(
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: "Search Tasks",
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.white70,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                // height: 200,

                color: Colors.white,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Consumer<TaskController>(
                      builder: (BuildContext context, TaskController value,
                          Widget? child) {
                        return MaterialSegmentedControl(
                          children: const {
                            0: Text(
                              'Today',
                              style: TextStyle(fontSize: 12),
                            ),
                            1: Text('  Tommorrow   ',
                                style: TextStyle(fontSize: 12)),
                            2: Text('Next 7D', style: TextStyle(fontSize: 12)),
                            3: Text('Range', style: TextStyle(fontSize: 12)),
                          },
                          selectionIndex: value.currentSelection,
                          borderColor: const Color(0xFFF8D349),
                          selectedColor: const Color(0xFFF8D349),
                          unselectedColor: Colors.white,
                          selectedTextStyle:
                              const TextStyle(color: Colors.white),
                          unselectedTextStyle:
                              const TextStyle(color: Color(0xFFF8D349)),
                          borderWidth: 0.7,
                          borderRadius: 20.0,
                          verticalOffset: 0.7,
                          onSegmentTapped: (index) =>
                              Provider.of<TaskController>(context,
                                      listen: false)
                                  .setSelectedIndex(index),
                        );
                      },
                    ),
                  ),
                  const TaskList(),
                  const CustomTabBar()
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

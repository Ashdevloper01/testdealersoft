import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_task_dealersoft/controllers/task_controller.dart';
import 'package:system_task_dealersoft/modal/items.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Item itemsData = Provider.of<TaskController>(context).userData;
    var theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          surfaceVariant: Colors.transparent,
        ),
      ),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: Color(0xFFF8D349),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white70,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                    color: Color(0xFFF8D349),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Start',
                    ),
                    Tab(
                      text: 'Complete',
                    ),
                    Tab(
                      text: 'Pause',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    /// Screen 1
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemsData.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Est. ${itemsData.number.toString()} mins',
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        'Actual: ${itemsData.Actual}',
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 25,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'JCB 2200',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    itemsData.address,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    itemsData.address2,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 25,
                                child: Icon(
                                  Icons.messenger_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    /// Screen 2
                    Container(
                      alignment: Alignment.center,
                      child: Text('Screen Complete'),
                    ),

                    /// Screen 3
                    Container(
                      alignment: Alignment.center,
                      child: Text('Screen Pause'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

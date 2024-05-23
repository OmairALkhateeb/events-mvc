import 'package:events_mvc/const/app_bar.dart';
import 'package:events_mvc/controller/order_controller.dart';
import 'package:events_mvc/model/order_model.dart';
import 'package:events_mvc/view/widget/admin_order_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class AdminArchivePage extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    // manual list before fetching data
    List<Order> fetchedOrders = [
    
    ];
    return Scaffold(
      appBar: mainAppBar(),
      drawer: const Drawer(),
      body: ListView.builder(
        itemCount: fetchedOrders.length,
        itemBuilder: (context, index) {
          return AdminOrderDesign(
            order: fetchedOrders[index],
          );
        },
      ),
    );
  }
}

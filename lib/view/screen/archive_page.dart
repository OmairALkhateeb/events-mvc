import 'package:events_mvc/const/app_bar.dart';
import 'package:events_mvc/model/order_model.dart';
import 'package:events_mvc/services/get_all_order.dart';
import 'package:events_mvc/view/widget/order_deisgn.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ArchivePage extends StatelessWidget {
  // final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    List<Order> fetchedOrders = [];
    return Scaffold(
      appBar: mainAppBar(),
      drawer: const Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [],
        floatHeaderSlivers: true,
        body: FutureBuilder<List<Order>>(
          future: OrdersService().getallOrders(),
          // Pass category name to getallhals method
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Order> allOrder = snapshot.data!;
              return GridView.builder(
                itemCount: allOrder.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  return OrderDesign(
                    order: allOrder[index],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

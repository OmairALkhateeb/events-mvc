import 'package:events_mvc/controller/order_controller.dart';
import 'package:events_mvc/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminOrderDesign extends StatelessWidget {
  final Order order;

  AdminOrderDesign({super.key, required this.order});
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(order.hallImage, width: 75),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.hall.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Obx(() => Text('Price: ${order.totalPrice} Dolar')),
                Obx(() => Text('Date: ${order.reservationDate}')),
                Obx(() => Text('${order.statusOfReservation}')),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.04,
                width: 90,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (order.statusOfReservation.value == OrderStatus.pending) {
                        orderController.acceptOrder(order);
                        // ignore: avoid_print
                        print('order accepted\n ${order.statusOfReservation}');
                      } else {
                        // ignore: avoid_print
                        print('orders status can not be change');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        backgroundColor:
                            order.statusOfReservation.value == OrderStatus.pending
                                ? Colors.green[400]
                                : Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Center(
                        child: Text(
                      'Accept',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: screenHeight * 0.04,
                width: 90,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (order.statusOfReservation.value == OrderStatus.pending) {
                        orderController.refuseOrder(order);
                        // ignore: avoid_print
                        print('order refused\n ${order.statusOfReservation}');
                      } else {
                        // ignore: avoid_print
                        print('orders status can not be change');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        backgroundColor:
                            order.statusOfReservation.value == OrderStatus.pending
                                ? Colors.red[400]
                                : Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Center(
                        child: Text(
                      'Refuse',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

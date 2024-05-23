import 'package:events_mvc/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderDesign extends StatelessWidget {
  final Order order;

  const OrderDesign({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
                Text('Price: ${order.totalPrice} Dollar'),
                Text('Date: ${order.reservationDate}'),
                Text('status: ${order.statusOfReservation}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

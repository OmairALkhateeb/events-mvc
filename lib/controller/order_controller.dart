// ignore_for_file: prefer_const_constructors
import 'package:events_mvc/model/order_model.dart';
import 'package:get/get.dart';

// Define OrderController to manage orders
class OrderController extends GetxController {
  RxList<Order> orders = <Order>[].obs;

  // Method to set orders fetched from backend
  void setOrders(List<Order> fetchedOrders) {
    orders.assignAll(fetchedOrders);
  }

  // Method to accept order
  void acceptOrder(Order order) {
    order.statusOfReservation.value = OrderStatus.accepted as String;
    update(); // Update UI after changing order status
  }

  // Method to refuse order
  void refuseOrder(Order order) {
    order.statusOfReservation.value = OrderStatus.refused as String;
    update(); // Update UI after changing order status
  }
}

import 'package:events_mvc/const/Api.dart';
import 'package:events_mvc/model/order_model.dart';

class OrdersService {
  Future<List<Order>> getallOrders() async {
    Map<String, dynamic> data = await Api().get(
        url:
            'http://127.0.0.1:8000/api/reservations');
    final orderData = data['THE Reservations'];
    List<Order> orderlist = [];
    for (var i = 0; i < orderData.length; i++) {
      orderlist.add(Order.fromJson(orderData[i]));
      print(orderlist[i]);
    }

    return orderlist;
  }
}

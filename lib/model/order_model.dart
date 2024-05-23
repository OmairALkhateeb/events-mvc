// Define enum for order status
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum OrderStatus { pending, accepted, refused }

class Dish {
  final RxString name;

  Dish({required String name}) : name = name.obs;

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.value,
    };
  }
}

class Order {
  final RxString user;
  final RxString hall;
  final RxString car;
  final RxString reservationTime;
  final RxString reservationDate;
  final RxString statusOfReservation;
  final RxString totalPrice;
  final RxString? notes;
  final RxList<Dish> dishes;
  final String hallImage = 'real.png';

  Order({
    required String user,
    required String hall,
    required String car,
    required String reservationTime,
    required String reservationDate,
    required String statusOfReservation,
    required String totalPrice,
    String? notes,
    required List<Dish> dishes,
  })  : user = user.obs,
        hall = hall.obs,
        car = car.obs,
        reservationTime = reservationTime.obs,
        reservationDate = reservationDate.obs,
        statusOfReservation = statusOfReservation.obs,
        totalPrice = totalPrice.obs,
        notes = notes?.obs,
        dishes = dishes.obs;

  factory Order.fromJson(Map<String, dynamic> json) {
    var dishesFromJson = json['dishes'] as List;
    List<Dish> dishesList =
        dishesFromJson.map((dish) => Dish.fromJson(dish)).toList();

    return Order(
      user: json['User'],
      hall: json['Hall'],
      car: json['Car'],
      reservationTime: json['Reservation Time'],
      reservationDate: json['Reservation Date'],
      statusOfReservation: json['Status Of Reservation '],
      totalPrice: json['Total Price'],
      notes: json['notes'],
      dishes: dishesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'User': user.value,
      'Hall': hall.value,
      'Car': car.value,
      'Reservation Time': reservationTime.value,
      'Reservation Date': reservationDate.value,
      'Status Of Reservation ': statusOfReservation.value,
      'Total Price': totalPrice.value,
      'notes': notes?.value,
      'dishes': dishes.map((dish) => dish.toJson()).toList(),
    };
  }
}

class ReservationsResponse {
  final RxList<Order> reservations;
  final RxString message;

  ReservationsResponse(
      {required List<Order> reservations, required String message})
      : reservations = reservations.obs,
        message = message.obs;

  factory ReservationsResponse.fromJson(Map<String, dynamic> json) {
    var reservationsFromJson = json['THE Reservations'] as List;
    List<Order> reservationsList = reservationsFromJson
        .map((reservation) => Order.fromJson(reservation))
        .toList();

    return ReservationsResponse(
      reservations: reservationsList,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'THE Reservations':
          reservations.map((reservation) => reservation.toJson()).toList(),
      'message': message.value,
    };
  }
}

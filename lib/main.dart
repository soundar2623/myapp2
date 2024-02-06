import 'package:flutter/material.dart';
import 'dart:io';


class House {
  String name;
  double price;
  bool isBooked;

  House(this.name, this.price, this.isBooked);
}

class BookingHouseApp {
  List<House> houses = [
    House('House 1', 100.0, false),
    House('House 2', 150.0, false),
    House('Apartment 1', 80.0, false),
    House('Condo 1', 120.0, false),
  ];

  void displayHouses() {
    print('Available Houses:');
    for (var house in houses) {
      print('${house.name} - \$${house.price} - ${house.isBooked
          ? 'Booked'
          : 'Available'}');
    }
    print('');
  }

  void bookHouse(String? houseName) {
    if (houseName == null) {
      print('Invalid input: houseName cannot be null.');
      return;
    }
      var selectedHouse = houses.firstWhere((house) => house.name == houseName,
          orElse: () => House('',20.0,false),
      );
        if (!selectedHouse.isBooked){
        selectedHouse.isBooked = true;
        print('Congratulations! ${selectedHouse.name} is booked.');
      } else {
        print('Sorry, ${houseName} is either already booked or not available.');
      }
    }
  }
void main() {
  String? nullableString = "House 1";
  var bookingApp = BookingHouseApp();

  while (true) {
    print('1. Display Available Houses');
    print('2. Book a House');
    stdout.write('Enter your choice (1-2): ');
    var input = stdin.readLineSync();
    var choice = int.tryParse(input ?? '');

    switch (choice) {
      case 1:
        bookingApp.displayHouses();
        break;
      case 2:
        stdout.write('Enter the name of the house you want to book: ');
        var houseToBook = stdin.readLineSync();
        if (houseToBook != null) {
          bookingApp.bookHouse(houseToBook);
        }else{
          print('Invalid input: House name cannot be null.');
        }
        break;
      default:
        print('Exiting the Booking House Application.');
        return;

    }

  }
}

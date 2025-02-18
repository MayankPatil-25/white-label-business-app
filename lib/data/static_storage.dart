import 'package:white_label_business_app/models/customer.dart';
import 'package:white_label_business_app/models/salon_catelog.dart';
import 'package:white_label_business_app/models/salon_service.dart';
import 'package:white_label_business_app/models/worker.dart';

class StaticStorage {

  static init() async {
    salonServices = await loadSalonServices();
    customersData = [
      Customer(id: 101, name: "Mayank Patil", age: 30, mobile: 9860961690, dateOfJoining: DateTime.now()),
      Customer(id: 102, name: "Priyanka Patil", age: 29, mobile: 8275583747, dateOfJoining: DateTime.now()),
      Customer(id: 103, name: "Pratiksha Patil", age: 27, mobile: 8446083929, dateOfJoining: DateTime.now()),
      Customer(id: 104, name: "Sunny Patil", age: 32, mobile: 1231231230, dateOfJoining: DateTime.now())
    ];

    workersData = [
      Worker(id: 101, name: "Narayan Wagh", age: 62, mobile: 9860961690, dateOfJoining: DateTime.now()),
      Worker(id: 102, name: "Rushikesh Wagh", age: 32, mobile: 8275583747, dateOfJoining: DateTime.now()),
      Worker(id: 103, name: "Mangesh Wagh", age: 42, mobile: 8446083929, dateOfJoining: DateTime.now()),
      Worker(id: 104, name: "Sunil Wagh", age: 52, mobile: 1231231230, dateOfJoining: DateTime.now())
    ];
  }

  static List<SalonService> salonServices = List.empty(growable: true);

  static List<Worker> workersData = List.empty(growable: true);

  static List<Customer> customersData = List.empty(growable: true);

  static final List<SalonCatalog> salonCatalog = [
    SalonCatalog(id: 1, name: "Haircut"),
    SalonCatalog(id: 2, name: "Beard"),
    SalonCatalog(id: 3, name: "Facial"),
    SalonCatalog(id: 4, name: "Hair Spa"),
    SalonCatalog(id: 5, name: "Face Clean Up"),
    SalonCatalog(id: 6, name: "Hair Colour")
  ];
}

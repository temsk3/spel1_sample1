import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String? eventID;
  final String? name;
  final int? price;

  Item({
    this.eventID,
    this.name,
    this.price,
  });

  factory Item.fromDocumentSnapshot(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data()! as Map<String, dynamic>;
    return Item(
      eventID: data['eventID'],
      name: data['name'],
      price: data['price'],
    );
  }
  Item.fromJson(Map<String, Object?> json)
      : this(
          eventID: json['eventID']! as String,
          name: json['name']! as String,
          price: json['price']! as int,
        );
  Map<String, Object?> toJSON() {
    return {
      'eventID': eventID,
      'name': name,
      'price': price,
    };
  }
}

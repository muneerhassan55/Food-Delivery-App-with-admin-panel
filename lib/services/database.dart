import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethods {
  // Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
  //   return await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(id)
  //       .set(userInfoMap);
  // }

  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set(userInfoMap);

      print("User added successfully");
    } catch (e) {
      print("Failed to add user: $e");
    }
  }

  UpdateUserwallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'Wallet': amount});
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    try {
      await FirebaseFirestore.instance.collection(name).add(userInfoMap);

      print("Item added successfully");
    } catch (e) {
      print("Failed to add item: $e");
    }
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('Cart')
          .add(userInfoMap);

      print("added to cart successfully");
    } catch (e) {
      print("Failed to add to cad: $e");
    }
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Cart')
        .snapshots();
  }
}

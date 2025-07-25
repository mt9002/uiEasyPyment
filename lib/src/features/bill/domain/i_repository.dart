

import 'package:first_app/src/features/bill/domain/bill.dart';
import 'package:first_app/src/features/bill/domain/response.dart';

abstract interface class IRepositoryBill {
  Future<Response<Bill?>?> addBill(Bill bill);
  //Future<Map<String, dynamic>?> getBill(String billId);
  //Future<void> updateBill(String billId, Map<String, dynamic> billData);
  //Future<void> deleteBill(String billId);
} 


import 'package:first_app/src/core/shared/response.dart';
import 'package:first_app/src/features/bill/domain/bill.dart';

abstract interface class BillRepository {
  Future<Response<Bill>> createBill(Bill bill);
  Future<Response<Bill?>> getBillById(String billId);
  Future<Response<List<Bill>>> getAllBills();
  Future<Response<void>> updateBill(Bill bill);
  Future<Response<void>> deleteBill(String billId);
}
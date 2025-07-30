import 'package:first_app/src/core/shared/response.dart';
import 'package:first_app/src/features/bill/domain/bill.dart';

abstract interface class IGetByIdBill {
  Future<Response<Bill?>> getById(String billId);
}

import 'package:first_app/src/core/shared/response.dart';
import 'package:first_app/src/features/bill/domain/bill.dart';
import 'package:first_app/src/features/bill/domain/incoming/get_by_id_bill.dart';
import 'package:first_app/src/features/bill/domain/outgoing/bill_repository.dart';

class UseCaseGetByIdBill implements IGetByIdBill {
  final BillRepository _billRepository;

  UseCaseGetByIdBill(this._billRepository);

  @override
  Future<Response<Bill?>> getById(String billId) {
    return _billRepository.getBillById(billId);
  }
}
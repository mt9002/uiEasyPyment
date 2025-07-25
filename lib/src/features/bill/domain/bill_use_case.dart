
import 'package:first_app/src/features/bill/domain/bill.dart';
import 'package:first_app/src/features/bill/domain/i_repository.dart';
import 'package:first_app/src/features/bill/domain/response.dart';

class BillUseCase {
  final IRepositoryBill _billRepository;

  BillUseCase(this._billRepository);

  Future<Response<Bill?>?> addBill(Bill bill) async {
    try {
      return await _billRepository.addBill(bill);
    } catch (e) {
      return Response.error('Error al crear la factura: $e');
    }
  }

/*   Future<Bill> getBillById(String id) async {
    return await _billRepository.getBillById(id);
  }

  Future<List<Bill>> getBills() async {
    return await _billRepository.getBills();
  }

  Future<void> updateBill(Bill bill) async {
    await _billRepository.updateBill(bill);
  }

  Future<void> deleteBill(String id) async {
    await _billRepository.deleteBill(id);
  } */
}
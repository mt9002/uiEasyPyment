import 'package:first_app/src/features/bill/domain/bill.dart';
import 'package:first_app/src/features/bill/domain/bill_use_case.dart';
import 'package:first_app/src/features/bill/domain/response.dart';
import 'package:first_app/src/features/bill/presentation/provider/bil_dto.dart';
import 'package:flutter/material.dart';

class BillProvider extends ChangeNotifier {
  final BillUseCase _billUseCase;
  final BillDTO _billDTO = BillDTO();
  Response<dynamic>? _resp = Response.noData();

  BillProvider(this._billUseCase);

  Future<void> createBill() async {
    _setUIState(OperationStatus.loading);

    _resp = await _billUseCase.addBill(Bill(
      event: _billDTO.getEvent,
      mesa: _billDTO.getMesa,
    ));
    if (_resp?.getResultState == ResultState.error) {
      _setResultState(ResultState.error);
    }
    _setUIState(OperationStatus.sending);
    
  }

  Response<dynamic>? get getResp => _resp;
  BillDTO get getBillDTO => _billDTO;

  void setEvent(String value) {
    _billDTO.setEvent(value);
  } 

  void setMesa(String value) {
    _billDTO.setMesa(value);
  }

  void _setUIState(OperationStatus uiState) {
    _resp!.setOperationStatus(uiState);
    notifyListeners();
  }

  void _setResultState(ResultState result) {
    _resp?.setResultState(result);
    notifyListeners();
  }
}

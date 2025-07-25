import 'package:first_app/src/features/bill/domain/bill.dart';
import 'package:first_app/src/features/bill/domain/bill_use_case.dart';
import 'package:first_app/src/features/bill/domain/response.dart';
import 'package:flutter/material.dart';

class BillProvider extends ChangeNotifier {
  final BillUseCase _billUseCase;
  Response<Bill?>? _resp;
  String _event;
  String _mesa;
  bool isLoading = false;
  bool isDatosEnviados = false;

  BillProvider(this._billUseCase)
      : _event = '',
        _mesa = '';

  String? validatorFilds(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  Future<void> createBill() async {
    isLoading = true;
    notifyListeners();

    _resp = await _billUseCase.addBill(Bill(event: _event, mesa: _mesa));

    isLoading = false;
    isDatosEnviados = true;
    notifyListeners();
  }

  get getEvent => _event;
  get getMesa => _mesa;
  Response<Bill?>? get getResp => _resp;

  void setEvent(String value) {
    _event = value;
  }

  void setMesa(String value) {
    _mesa = value;
  }
}
import 'dart:convert';

import 'package:first_app/src/features/bill/domain/bill.dart';
import 'package:first_app/src/features/bill/domain/i_repository.dart';
import 'package:first_app/src/features/bill/domain/response.dart';
import 'package:first_app/src/features/bill/presentation/request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImplBill implements IRepositoryBill {
  @override
  Future<Response<Bill?>?> addBill(Bill bill) async {
    final uriBill = dotenv.env['URI_BILL'];
    final token = dotenv.env['AUTH_TOKEN'];

    Request request = Request();
    final response = await request.post(
      uriBill,
      token!,
      {'event': bill.getEvent, 'mesa': bill.getMesa},
    );
    final bodyResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      Bill billResp = Bill.fromJson(bodyResponse['data']);
      return Response.success('Factura creada con éxito', billResp);
    } else {
      final String message = bodyResponse['message'] ?? 'Error desconocido';
      return Response.error('$message: ${response.statusCode}');
    }
  }
}

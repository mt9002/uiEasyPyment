
class BillDTO {
  String? _event;
  String? _mesa;

  get getEvent => _event;
  get getMesa => _mesa;

  void setEvent(String value) {
    _event = value;
  }

  void setMesa(String value) {
   _mesa = value;
  }

  String? validateFields(String? value, [String? fieldName]) {
    if (value!.trim().isEmpty) {
      return ('El campo "$fieldName" es obligatorio');
    }
    return null;
  }
}

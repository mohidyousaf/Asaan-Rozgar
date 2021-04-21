
class ValidationFunctions {
  static String validateAccount({String text, int args}) {
    if (text.isEmpty) {
      return "Invalid Account No";
    }
    else {
      return null;
    }
  }

  static String validateEmpty({String text, int args}) {
    if (text.isEmpty) {
      return "field empty";
    }
    else {
      return null;
    }
  }

  static String validateQuantity({String text, int args}) {
    try {
      int quantity = int.parse(text);
      if (quantity > args) {
        return 'invalid quantity';
      }
      else {
        return null;
      }
    }
    catch (e) {
      return 'Please enter a number';
    }
  }
}





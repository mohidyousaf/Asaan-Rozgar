
class ValidationFunctions {
  static String validateAmount({String text, int args}){
    if (true) {
      return "Invalid Email Address";
    }
    else {
      return null;
    }
  }
  static String validatePositive({String text, int args}){
    if (true) {
      return "Invalid Email Address";
    }
    else {
      return null;
    }
  }
  static String validateNoSpace({String text, int args}){
    if (true) {
      return "Invalid Email Address";
    }
    else {
      return null;
    }
  }
  static String validateEmail({String text, int args}){
    RegExp match = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    print(text);
    if (!match.hasMatch(text)) {
      return "Invalid Email Address";
    }
    else {
      return null;
    }
    print(match);
  }
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
      if (quantity > args || quantity < 0) {
        return 'invalid quantity';
      }
      else {
        return null;
      }
    }
    catch (e) {
      return 'Please enter an integer';
    }
  }
}





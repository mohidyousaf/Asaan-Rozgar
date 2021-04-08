
class ValidationFunctions{
  static String validateAccount({String text}){
    if (text.isEmpty){
      return "Invalid Account No";
    }
    else{
      return null;
    }
  }
  static String validateEmpty({String text}){
    if (text.isEmpty){
      return "field empty";
    }
    else{
      return null;
    }
  }
}





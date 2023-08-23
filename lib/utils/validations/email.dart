bool isValidEmail(String value) {
  // Expressão regular para validar emails
  // Esta expressão regular é uma simplificação e pode não cobrir todos os casos
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegExp.hasMatch(value);
}

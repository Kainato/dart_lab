import 'dart:io';

void main() {
  // Entrada de dados
  int n = int.parse(stdin.readLineSync()!);
  int m = int.parse(stdin.readLineSync()!);

  // Cálculo e saída dos dados
  print('${n - m}');
}

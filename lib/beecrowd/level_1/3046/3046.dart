import 'dart:io';

void main() {
  // Entrada de dados
  int n = int.parse(stdin.readLineSync()!);

  // Processamento e cálculo do resultado
  double resultado = ((n + 1) * (n + 2)) / 2;

  // Saída de dados
  print(resultado.toStringAsFixed(0));
}

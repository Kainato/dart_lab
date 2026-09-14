import 'dart:io';

void main() {
  // Recebe o número de lados do polígono
  final int n = int.parse(stdin.readLineSync()!);

  // Calcula o número mínimo de triângulos necessários
  print(n - 2);
}

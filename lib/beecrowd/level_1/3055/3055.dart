import 'dart:io';

void main() {
  // Lê a nota de uma prova e a média das duas provas, e calcula a nota da outra prova.
  int a = int.parse(stdin.readLineSync()!);
  int m = int.parse(stdin.readLineSync()!);

  // Calcula a nota da outra prova usando a fórmula B = 2 * M - A.
  int b = 2 * m - a;

  // Imprime a nota da outra prova.
  print(b);
}

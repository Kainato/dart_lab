import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync()!);
  int resultadoFatorial = 1;

  for (int i = 1; i <= n; i++) {
    resultadoFatorial *= i;
  }

  print(resultadoFatorial);
}

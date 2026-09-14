import 'dart:io';

void main() {
  // Entrada de dados
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= n; i++) {
    // Processamento e cálculo do resultado
    int quadrado = i * i;
    int cubo = i * i * i;

    // Saída de dados
    print('$i $quadrado $cubo');
  }
}

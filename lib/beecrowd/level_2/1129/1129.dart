import 'dart:io';

void main() {
  while (true) {
    int n = int.parse(stdin.readLineSync()!);
    if (n == 0) break;

    for (int i = 0; i < n; i++) {
      List<int> values =
          stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();

      // Contar quantos valores são <= 127 (pretos)
      List<String> letters = ['A', 'B', 'C', 'D', 'E'];
      int blackCount = 0;
      int blackIndex = -1;

      for (int j = 0; j < 5; j++) {
        if (values[j] <= 127) {
          blackCount++;
          blackIndex = j;
        }
      }

      // Se exatamente um quadrado foi marcado (preto), essa é a resposta
      if (blackCount == 1) {
        print(letters[blackIndex]);
      } else {
        // Caso contrário, desconsiderar a resposta
        print('*');
      }
    }
  }
}

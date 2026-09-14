import 'dart:io';

void main() {
  // Entrada de dados
  List<String> inputLine1 = stdin.readLineSync()!.split(' ');
  int n = int.parse(inputLine1[0]);
  int s = int.parse(inputLine1[1]);

  List<int> movimentacao = [];
  for (int i = 0; i < n; i++) {
    movimentacao.add(int.parse(stdin.readLineSync()!));
  }

  // Cálculo e saída dos dados
  int menorSaldo = s;
  for (int i = 0; i < n; i++) {
    s += movimentacao[i];
    if (s < menorSaldo) {
      menorSaldo = s;
    }
  }
  print(menorSaldo);
}

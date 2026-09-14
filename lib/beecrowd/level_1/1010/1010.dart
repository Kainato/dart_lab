import 'dart:io';

void main() {
  List<String> line1 = stdin.readLineSync()!.split(' ');
  List<String> line2 = stdin.readLineSync()!.split(' ');

  // int code1 = int.parse(line1[0]);
  int qtd1 = int.parse(line1[1]);
  double valor1 = double.parse(line1[2]);

  // int code2 = int.parse(line2[0]);
  int qtd2 = int.parse(line2[1]);
  double valor2 = double.parse(line2[2]);

  double total = (qtd1 * valor1) + (qtd2 * valor2);

  print('VALOR A PAGAR: R\$ ${total.toStringAsFixed(2)}');
}

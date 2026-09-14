import 'dart:io';

void main() {
  // Define a lista de notas
  List<double> notas = [];

  // Define os pesos das notas
  double pesoA = 2;
  double pesoB = 3;
  double pesoC = 5;

  for (int i = 0; i < 3; i++) {
    // Lê a nota e a adiciona à lista
    notas.add(double.parse(stdin.readLineSync()!));
  }

  // Calcula a média ponderada
  final double media =
      (notas[0] * pesoA + notas[1] * pesoB + notas[2] * pesoC) /
          (pesoA + pesoB + pesoC);
  // Imprime a média com uma casa decimal
  print('MEDIA = ${media.toStringAsFixed(1)}');
}

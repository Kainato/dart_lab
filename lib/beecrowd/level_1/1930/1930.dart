import 'dart:io';

void main() {
  // Recebe o número de tomadas de cada régua
  final List<int> tomadas =
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();

  // Calcula o número máximo de aparelhos que podem ser conectados
  print(tomadas.reduce((value, element) => value + element) - 3);
}

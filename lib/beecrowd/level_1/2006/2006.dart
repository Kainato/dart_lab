import 'dart:io';

void main() {
  // Recebe o tipo de chá
  final int tipoDoCha = int.parse(stdin.readLineSync()!);
  // Recebe as respostas dos competidores
  final List<int> respostas =
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();

  // Inicia a variável de acertos em 0
  int acertos = 0;

  // Verifica se a resposta do competidor é igual ao tipo de chá
  //e incrementa a variável de acertos
  for (int resposta in respostas) {
    if (resposta == tipoDoCha) {
      acertos++;
    }
  }

  print(acertos);
}

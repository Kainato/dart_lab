import 'dart:io';

void main() {
  // Lê o número de casos de teste
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    // Lê os valores A e B como strings
    List<String> valores = stdin.readLineSync()!.split(' ');
    String a = valores[0];
    String b = valores[1];

    // Verifica se B encaixa em A
    if (a.endsWith(b)) {
      stdout.writeln('encaixa');
    } else {
      stdout.writeln('nao encaixa');
    }
  }
}

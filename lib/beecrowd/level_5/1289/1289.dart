import 'dart:io';

double pow(double base, int exponent) {
  double result = 1.0;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

void main() {
  int s = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < s; i++) {
    List<String> valores = stdin.readLineSync()!.trim().split(RegExp(r'\s+'));

    int n = int.parse(valores[0]);
    double p = double.parse(valores[1]);
    int jogadorI = int.parse(valores[2]);

    double probabilidade;

    // Casos especiais
    if (p == 0.0) {
      // Se p = 0, ninguém nunca ganha
      probabilidade = 0.0;
    } else if (p == 1.0) {
      // Se p = 1, só o primeiro jogador ganha
      probabilidade = (jogadorI == 1) ? 1.0 : 0.0;
    } else {
      // Calcula a probabilidade de ganhar do jogador I
      double probNaoGanhar = 1 - p;
      double numerador = p * pow(probNaoGanhar, jogadorI - 1);
      double denominador = 1 - pow(probNaoGanhar, n);

      probabilidade = numerador / denominador;
    }

    // Imprime a probabilidade com 4 casas decimais
    stdout.writeln(probabilidade.toStringAsFixed(4));
  }
}

import 'dart:io';

void main() {
  // Lê o salário do usuário
  double salario = double.parse(stdin.readLineSync()!);

  // Inicializa o imposto a ser pago
  double imposto = 0.0;

  // Verifica as faixas de imposto e calcula o valor do imposto
  if (salario <= 2000) {
    imposto = 0;
  } else if (salario > 2000 && salario <= 3000) {
    // Calcula o imposto para a faixa de 2000 a 3000
    // O imposto é de 8% sobre o valor que excede 2000
    imposto = (salario - 2000) * 0.08;
  } else if (salario > 3000 && salario <= 4500) {
    // Calcula o imposto para a faixa de 3000 a 4500
    // O imposto é de 8% sobre os primeiros 1000 (de 2000 a 3000)
    imposto = (salario - 3000) * 0.18 + (1000 * 0.08);
  } else {
    // Calcula o imposto para salários acima de 4500
    // O imposto é de 8% sobre os primeiros 1000 (de 2000 a 3000)
    imposto = (salario - 4500) * 0.28 + (1500 * 0.18) + (1000 * 0.08);
  }

  // Verifica se o imposto é zero e imprime a mensagem correspondente
  if (imposto == 0) {
    print('Isento');
  } else {
    // Imprime o valor do imposto com duas casas decimais
    print('R\$ ${imposto.toStringAsFixed(2)}');
  }
}

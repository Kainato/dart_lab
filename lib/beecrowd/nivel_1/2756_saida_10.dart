/* Saída 10
O seu professor de programação gostaria que você fizesse um programa com as seguintes características:

Coloque sete espaços em branco e coloque o carácter 'A';
Coloque seis espaços em branco e coloque o carácter 'B', um espaço em branco e o carácter 'B';
Coloque cinco espaços em branco e coloque o carácter 'C', três espaço em branco e o carácter 'C';
Coloque quatro espaços em branco e coloque o carácter 'D', cinco espaço em branco e o carácter 'D';
Coloque três espaços em branco e coloque o carácter 'E', sete espaço em branco e o carácter 'E';
Repita o procedimento 4;
Repita o procedimento 3;
Repita o procedimento 2;
Repita o procedimento 1.
Entrada
Não há.

Saída
O resultado de seu programa deve ser escrito conforme o exemplo de saída.
*/

/* Resolução simplificada
void main() {
  print('       A');
  print('      B B');
  print('     C   C');
  print('    D     D');
  print('   E       E');
  print('    D     D');
  print('     C   C');
  print('      B B');
  print('       A');
}
*/

import 'dart:io';

void main() {
  // Definindo a letra índice máximo
  const target = 'E';
  final maxIndex = target.codeUnitAt(0) - 65; // 65 é o código ASCII de 'A'

  // Metade superior e linha central -> Crescendo o espaçamento
  for (var i = 0; i <= maxIndex; i++) {
    printLine(i, maxIndex);
  }

  // Metade inferior -> Decrescendo o espaçamento
  for (var i = maxIndex - 1; i >= 0; i--) {
    printLine(i, maxIndex);
  }
}

// Função para imprimir cada linha com base no índice da letra e no índice máximo
void printLine(int index, int maxIndex) {
  // Gerando a letra correspondente ao índice
  final letter = String.fromCharCode(65 + index);
  // Calculando o espaço externo necessário para alinhar a letra à direita
  final outerSpace = ' ' * ((2 * maxIndex - 1) - index);

  if (index == 0) {
    stdout.writeln('$outerSpace$letter');
  } else {
    final innerSpace = ' ' * (2 * index - 1);
    stdout.writeln('$outerSpace$letter$innerSpace$letter');
  }
}

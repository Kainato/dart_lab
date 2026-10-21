import 'dart:io';
import 'dart:convert';

/// Realiza a criptografia de uma string aplicando três transformações:
/// 1. Desloca letras 3 posições para a direita na tabela ASCII
/// 2. Inverte a string resultante
/// 3. Desloca a metade final em 1 posição para a esquerda na tabela ASCII
String encrypt(String line) {
  final codes = <int>[];
  for (int i = 0; i < line.length; i++) {
    int charCode = line.codeUnitAt(i);

    if ((charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122)) {
      codes.add(charCode + 3);
    } else {
      codes.add(charCode);
    }
  }

  int len = codes.length;
  int midpoint = len ~/ 2;
  final result = <int>[];

  for (int i = len - 1; i >= 0; i--) {
    int charCode = codes[i];
    int newPos = len - 1 - i;

    if (newPos >= midpoint) {
      result.add(charCode - 1);
    } else {
      result.add(charCode);
    }
  }

  return String.fromCharCodes(result);
}

void main() async {
  // Lê todas as linhas do stdin de uma única vez de forma assíncrona e eficiente
  final lines =
      await utf8.decoder.bind(stdin).transform(const LineSplitter()).toList();

  if (lines.isEmpty) return;

  int n = int.parse(lines[0].trim());
  final buffer = StringBuffer();

  // Processa cada caso de teste a partir da lista em memória
  for (int i = 1; i <= n && i < lines.length; i++) {
    buffer.writeln(encrypt(lines[i]));
  }

  // Escreve toda a saída de uma única vez
  stdout.write(buffer.toString());
}

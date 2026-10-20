import 'dart:convert';
import 'dart:io';

/// Simula a operação de um circuito somador de 32 bits defeituoso
/// onde o carry possui saída constante igual a zero.
///
/// A operação equivale à porta lógica XOR (Ou Exclusivo),
/// realizando a soma aritmética sem transporte de vai-um (carry).
void main() async {
  /// Usa stream para ler a entrada de forma eficiente
  final buffer = StringBuffer();

  await stdin
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .forEach((line) {
    if (line.isNotEmpty) {
      final parts = line.split(' ');
      final a = int.parse(parts[0]);
      final b = int.parse(parts[1]);

      /// Operação XOR sem carry (soma lógica)
      /// Para cada par de bits:
      /// - Bits iguais (0+0 ou 1+1) → resultado: 0
      /// - Bits diferentes (0+1 ou 1+0) → resultado: 1
      buffer.writeln(a ^ b);
    }
  });

  stdout.write(buffer);
}

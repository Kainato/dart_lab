import 'dart:io';

bool canBond(String base1, String base2) {
  return (base1 == 'B' && base2 == 'S') ||
         (base1 == 'S' && base2 == 'B') ||
         (base1 == 'C' && base2 == 'F') ||
         (base1 == 'F' && base2 == 'C');
}

void main() {
  String? line;
  while ((line = stdin.readLineSync()) != null) {
    String rna = line!.trim();
    if (rna.isEmpty) continue;

    List<String> stack = [];
    int bonds = 0;

    for (int i = 0; i < rna.length; i++) {
      String current = rna[i];

      // Se a pilha não estiver vazia e o topo formar um par válido com a base atual
      if (stack.isNotEmpty && canBond(stack.last, current)) {
        stack.removeLast(); // Remove a base do topo (dobra/liga)
        bonds++;            // Incrementa o contador de ligações
      } else {
        stack.add(current); // Adiciona na pilha para tentar formar par depois
      }
    }

    print(bonds);
  }
}

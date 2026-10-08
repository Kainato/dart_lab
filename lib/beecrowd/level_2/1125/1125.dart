import 'dart:io';

void main() {
  while (true) {
    final line = stdin.readLineSync()!.split(' ');
    final G = int.parse(line[0]); // número de grandes prêmios
    final P = int.parse(line[1]); // número de pilotos

    if (G == 0 && P == 0) break;

    // Ler os resultados das corridas
    List<List<int>> results = [];
    for (int i = 0; i < G; i++) {
      final positions =
          stdin.readLineSync()!.split(' ').map(int.parse).toList();
      results.add(positions);
    }

    // Ler o número de sistemas de pontuação
    final S = int.parse(stdin.readLineSync()!);

    // Para cada sistema de pontuação
    for (int s = 0; s < S; s++) {
      final scoreLine = stdin.readLineSync()!.split(' ');
      final K = int.parse(scoreLine[0]); // máximas posições que recebem pontos
      final points =
          scoreLine.sublist(1).map(int.parse).toList(); // pontos por posição

      // Calcular pontos totais para cada piloto
      List<int> totalPoints = List.filled(P + 1, 0);

      for (int race = 0; race < G; race++) {
        final positions = results[race];
        for (int pilot = 1; pilot <= P; pilot++) {
          final position = positions[pilot - 1]; // posição do piloto (1-based)
          if (position >= 1 && position <= K) {
            totalPoints[pilot] += points[position - 1];
          }
        }
      }

      // Encontrar o máximo de pontos
      int maxPoints = 0;
      for (int i = 1; i <= P; i++) {
        if (totalPoints[i] > maxPoints) {
          maxPoints = totalPoints[i];
        }
      }

      // Encontrar todos os campeões (pode haver empate)
      List<int> champions = [];
      for (int i = 1; i <= P; i++) {
        if (totalPoints[i] == maxPoints) {
          champions.add(i);
        }
      }

      // Imprimir os campeões em ordem crescente
      print(champions.join(' '));
    }
  }
}

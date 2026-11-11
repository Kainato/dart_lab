import 'package:dart_lab/beecrowd/level_2/1130/1130.dart' as solution;
import 'package:test/test.dart';

final _memo = <String, bool>{};

bool _hasThree(String b) => b.contains('XXX');

// Força bruta: true se quem joga garante vitória.
bool _brute(String b) {
  final cached = _memo[b];
  if (cached != null) return cached;
  bool win = false;
  for (int i = 0; i < b.length && !win; i++) {
    if (b[i] != '.') continue;
    final nb = '${b.substring(0, i)}X${b.substring(i + 1)}';
    if (_hasThree(nb) || !_brute(nb)) win = true;
  }
  return _memo[b] = win;
}

void main() {
  group('Exemplos', () {
    test('.....', () => expect(solution.canMariaWin('.....'), true));
    test('..X..', () => expect(solution.canMariaWin('..X..'), false));
    test('X.X.X.', () => expect(solution.canMariaWin('X.X.X.'), true));
    test('12 vazias', () => expect(solution.canMariaWin('.' * 12), false));
  });

  group('Comparação com força bruta', () {
    for (int n = 3; n <= 12; n++) {
      test('todos os tabuleiros de tamanho $n', () {
        for (int mask = 0; mask < (1 << n); mask++) {
          final b = String.fromCharCodes(
              List.generate(n, (i) => (mask >> i) & 1 == 1 ? 88 : 46));
          if (_hasThree(b)) continue;
          expect(solution.canMariaWin(b), _brute(b), reason: b);
        }
      });
    }
  });

  group('Desempenho', () {
    test('N=10000 vazio', () {
      final sw = Stopwatch()..start();
      solution.canMariaWin('.' * 10000);
      expect(sw.elapsedMilliseconds, lessThan(3000));
    });
  });
}

import 'package:dart_lab/beecrowd/level_2/1130/1130.dart' as solution;
import 'package:test/test.dart';

void main() {
  group('Teste do problema 1130 - Jogo da Velha (Otimizado)', () {
    group('Casos do Exemplo', () {
      test('Caso 1: Tabuleiro vazio de tamanho 5 -> S', () {
        expect(solution.canMariaWin('.....'), true);
      });

      test('Caso 2: Tabuleiro com X no centro ..X.. -> N', () {
        expect(solution.canMariaWin('..X..'), false);
      });

      test('Caso 3: Tabuleiro X.X.X. -> S', () {
        expect(solution.canMariaWin('X.X.X.'), true);
      });

      test('Caso 4: Tabuleiro vazio de tamanho 12 -> N', () {
        expect(solution.canMariaWin('............'), false);
      });
    });

    group('Casos de Borda', () {
      test('Tabuleiro vazio mínimo N=3 -> S', () {
        expect(solution.canMariaWin('...'), true);
      });

      test('Tabuleiro sem casas seguras -> N', () {
        expect(solution.canMariaWin('X..X'), false);
      });

      test('Tabuleiro com X em todas as posições exceto uma (vitória imediata) -> S', () {
        expect(solution.canMariaWin('X.X'), true);
      });

      test('Tabuleiro com padrão XX. -> S', () {
        expect(solution.canMariaWin('XX.'), true);
      });

      test('Tabuleiro com padrão .XX -> S', () {
        expect(solution.canMariaWin('.XX'), true);
      });

      test('Tabuleiro com padrão X.X (vitória imediata) -> S', () {
        expect(solution.canMariaWin('X.X'), true);
      });

      test('Tabuleiro com X isolado, espaço suficiente X...X -> N', () {
        expect(solution.canMariaWin('X...X'), false);
      });

      test('Tabuleiro grande vazio N=10000 -> validação', () {
        String largeBoard = '.' * 10000;
        bool result = solution.canMariaWin(largeBoard);
        expect(result, isNotNull);
      });
    });

    group('Testes de Vitória Imediata', () {
      test('Detecta padrão XX. no início', () {
        expect(solution.canMariaWin('XX.'), true);
      });

      test('Detecta padrão .XX no final', () {
        expect(solution.canMariaWin('.XX'), true);
      });

      test('Detecta padrão X.X no meio', () {
        expect(solution.canMariaWin('X.X'), true);
      });

      test('Detecta padrão XX. com sufixo', () {
        expect(solution.canMariaWin('XX...'), true);
      });

      test('Não detecta vitória quando não há padrão (casas distantes)', () {
        expect(solution.canMariaWin('X..X..'), false);
      });

      test('Não detecta vitória quando há XXX', () {
        expect(solution.canMariaWin('XXX'), false);
      });
    });

    group('Testes de Lógica Combinatorial', () {
      test('Um segmento de tamanho 1 (ímpar) -> S', () {
        expect(solution.canMariaWin('.'), true);
      });

      test('Um segmento de tamanho 2 (par) -> N', () {
        expect(solution.canMariaWin('..'), false);
      });

      test('Um segmento de tamanho 3 (ímpar) -> S', () {
        expect(solution.canMariaWin('...'), true);
      });

      test('Um segmento de tamanho 4 (par) -> N', () {
        expect(solution.canMariaWin('....'), false);
      });

      test('Dois segmentos pares XOR = 0 -> N', () {
        expect(solution.canMariaWin('..X..'), false);
      });

      test('Dois segmentos ímpares XOR = 0 -> N', () {
        expect(solution.canMariaWin('.X.'), false);
      });

      test('Um segmento par e um ímpar XOR != 0 -> S', () {
        expect(solution.canMariaWin('...X..'), true);
      });
    });

    group('Testes de Performance', () {
      test('Processa tabuleiro grande sem erro', () {
        String board = '.' * 5000 + 'X' + '.' * 5000;
        expect(solution.canMariaWin(board), isNotNull);
      });

      test('Processa tabuleiro com muitos X sem erro', () {
        String board = '';
        for (int i = 0; i < 1000; i++) {
          board += 'X.';
        }
        expect(solution.canMariaWin(board), isNotNull);
      });

      test('Processa muitos testes consecutivos', () {
        for (int i = 0; i < 100; i++) {
          String board = '.' * (i + 1);
          solution.canMariaWin(board);
        }
        expect(true, true);
      });
    });
  });
}

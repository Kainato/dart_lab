import 'dart:io';
import 'dart:math';

/// Calcula XOR dos Grundy de segmentos seguros de forma otimizada
/// Combina tudo em um único passe para máxima eficiência
int calculateXorOfSegments(String board) {
  int n = board.length;
  List<bool> dangerous = List<bool>.filled(n, false);

  // Marca casas perigosas (até 2 posições de um X)
  for (int i = 0; i < n; i++) {
    if (board[i] == 'X') {
      int start = max(0, i - 2);
      int end = min(n - 1, i + 2);
      for (int j = start; j < i; j++) {
        dangerous[j] = true;
      }
      for (int j = i + 1; j <= end; j++) {
        dangerous[j] = true;
      }
    }
  }

  // Calcula XOR de segmentos em um único passe
  // G(n) = n % 2, então xor apenas muda se o segmento tem comprimento ímpar
  int xorSum = 0;
  int segmentLength = 0;

  for (int i = 0; i < n; i++) {
    if (board[i] == '.' && !dangerous[i]) {
      segmentLength++;
    } else {
      if (segmentLength > 0) {
        if ((segmentLength & 1) == 1) {
          // Se comprimento é ímpar
          xorSum ^= 1;
        }
        segmentLength = 0;
      }
    }
  }

  if (segmentLength > 0 && (segmentLength & 1) == 1) {
    xorSum ^= 1;
  }

  return xorSum;
}

/// Determina se Maria tem estratégia vencedora
bool canMariaWin(String board) {
  int n = board.length;

  // Verificação 1: Vitória imediata - padrões XX., .XX, X.X
  for (int i = 0; i < n; i++) {
    if (board[i] != '.') continue;

    if (i >= 2 && board[i - 1] == 'X' && board[i - 2] == 'X') {
      return true;
    }
    if (i + 2 < n && board[i + 1] == 'X' && board[i + 2] == 'X') {
      return true;
    }
    if (i >= 1 && i + 1 < n && board[i - 1] == 'X' && board[i + 1] == 'X') {
      return true;
    }
  }

  // Verificação 2: XOR de Grundy dos segmentos seguros
  return calculateXorOfSegments(board) != 0;
}

void main() {
  String? line;
  while (true) {
    line = stdin.readLineSync();
    if (line == null || line == '0') break;

    String board = stdin.readLineSync()!;
    print(canMariaWin(board) ? 'S' : 'N');
  }
}

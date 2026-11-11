import 'dart:io';
import 'dart:typed_data';

// Grundy de um segmento de L casas seguras: jogar em i deixa max(0,i-2) e max(0,L-i-3).
Int32List _grundy = Int32List(1);

void _ensureGrundy(int maxLen) {
  if (maxLen < _grundy.length) return;
  final g = Int32List(maxLen + 1);
  g.setRange(0, _grundy.length, _grundy);
  final seen = Int32List(1024);
  for (int len = _grundy.length; len <= maxLen; len++) {
    for (int i = 0; i < len; i++) {
      final left = i > 2 ? i - 2 : 0;
      final right = len - i - 3 > 0 ? len - i - 3 : 0;
      seen[g[left] ^ g[right]] = len;
    }
    int mex = 0;
    while (seen[mex] == len) {
      mex++;
    }
    g[len] = mex;
  }
  _grundy = g;
}

bool canMariaWin(String board) {
  final n = board.length;
  const dot = 46, x = 88;
  final c = board.codeUnits;

  for (int i = 0; i < n; i++) {
    if (c[i] != dot) continue;
    if (i >= 2 && c[i - 1] == x && c[i - 2] == x) return true;
    if (i + 2 < n && c[i + 1] == x && c[i + 2] == x) return true;
    if (i >= 1 && i + 1 < n && c[i - 1] == x && c[i + 1] == x) return true;
  }

  // Casa segura: vazia e a distância >= 3 de qualquer X.
  _ensureGrundy(n);
  int xorSum = 0;
  int run = 0;
  int lastX = -1000000;
  int nextX = -1;
  for (int i = 0; i < n; i++) {
    if (nextX < i) {
      nextX = i;
      while (nextX < n && c[nextX] != x) {
        nextX++;
      }
    }
    if (c[i] == x) lastX = i;
    final safe =
        c[i] == dot && i - lastX >= 3 && (nextX >= n || nextX - i >= 3);
    if (safe) {
      run++;
    } else {
      xorSum ^= _grundy[run];
      run = 0;
    }
  }
  xorSum ^= _grundy[run];

  return xorSum != 0;
}

void main() {
  final tokens = <String>[];
  String? line;
  while ((line = stdin.readLineSync()) != null) {
    tokens
        .addAll(line!.trim().split(RegExp(r'\s+')).where((t) => t.isNotEmpty));
  }

  int maxLen = 0;
  for (int i = 0; i + 1 < tokens.length; i += 2) {
    if (tokens[i] == '0') break;
    if (tokens[i + 1].length > maxLen) maxLen = tokens[i + 1].length;
  }
  _ensureGrundy(maxLen);

  final out = StringBuffer();
  for (int i = 0; i + 1 < tokens.length; i += 2) {
    if (tokens[i] == '0') break;
    out.writeln(canMariaWin(tokens[i + 1]) ? 'S' : 'N');
  }
  stdout.write(out);
}

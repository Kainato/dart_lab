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
    if (len < 5) {
      for (int i = 0; i < len; i++) {
        final left = i > 2 ? i - 2 : 0;
        final right = len - i - 3 > 0 ? len - i - 3 : 0;
        seen[g[left] ^ g[right]] = len;
      }
    } else {
      // Pares simétricos (a, len-5-a) mais as jogadas nas bordas.
      seen[g[len - 3]] = len;
      seen[g[len - 4]] = len;
      final half = (len - 5) >> 1;
      for (int a = 0; a <= half; a++) {
        seen[g[a] ^ g[len - 5 - a]] = len;
      }
    }
    int mex = 0;
    while (seen[mex] == len) {
      mex++;
    }
    g[len] = mex;
  }
  _grundy = g;
}

bool _solve(List<int> c, int start, int n) {
  const dot = 46, x = 88;
  final end = start + n;

  for (int i = start; i < end; i++) {
    if (c[i] != dot) continue;
    if (i - start >= 2 && c[i - 1] == x && c[i - 2] == x) return true;
    if (i + 2 < end && c[i + 1] == x && c[i + 2] == x) return true;
    if (i - start >= 1 && i + 1 < end && c[i - 1] == x && c[i + 1] == x) {
      return true;
    }
  }

  // Casa segura: vazia e a distância >= 3 de qualquer X.
  _ensureGrundy(n);
  int xorSum = 0;
  int run = 0;
  int lastX = -1000000;
  int nextX = -1;
  for (int i = start; i < end; i++) {
    if (nextX < i) {
      nextX = i;
      while (nextX < end && c[nextX] != x) {
        nextX++;
      }
    }
    if (c[i] == x) lastX = i;
    final safe =
        c[i] == dot && i - lastX >= 3 && (nextX >= end || nextX - i >= 3);
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

bool canMariaWin(String board) => _solve(board.codeUnits, 0, board.length);

Future<void> main() async {
  // readLineSync lê byte a byte e é lento; lê tudo em blocos.
  final builder = BytesBuilder(copy: false);
  await for (final chunk in stdin) {
    builder.add(chunk);
  }
  final data = builder.takeBytes();
  final len = data.length;

  final starts = <int>[];
  final sizes = <int>[];
  int maxLen = 0;
  int p = 0;
  while (true) {
    while (p < len && data[p] <= 32) {
      p++;
    }
    if (p >= len) break;
    int n = 0;
    while (p < len && data[p] > 32) {
      n = n * 10 + (data[p] - 48);
      p++;
    }
    if (n == 0) break;
    while (p < len && data[p] <= 32) {
      p++;
    }
    final s = p;
    while (p < len && data[p] > 32) {
      p++;
    }
    starts.add(s);
    sizes.add(p - s);
    if (p - s > maxLen) maxLen = p - s;
  }

  _ensureGrundy(maxLen);

  final out = StringBuffer();
  for (int k = 0; k < starts.length; k++) {
    out.writeln(_solve(data, starts[k], sizes[k]) ? 'S' : 'N');
  }
  stdout.write(out);
}

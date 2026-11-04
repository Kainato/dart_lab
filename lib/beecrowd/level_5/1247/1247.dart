import 'dart:io';

void main() {
  String? line;

  while ((line = stdin.readLineSync()) != null) {
    final currentLine = line!.trim();

    if (currentLine.isEmpty) {
      continue;
    }

    final values = currentLine.split(RegExp(r'\s+'));

    final d = int.parse(values[0]);
    final vf = int.parse(values[1]);
    final vg = int.parse(values[2]);

    final left = 144 * vg * vg;
    final right = vf * vf * (d * d + 144);

    if (left >= right) {
      stdout.writeln('S');
    } else {
      stdout.writeln('N');
    }
  }
}

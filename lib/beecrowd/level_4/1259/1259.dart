import 'dart:io';

String solve(List<int> values) {
  final evenNumbers = <int>[];
  final oddNumbers = <int>[];

  for (final value in values) {
    if (value % 2 == 0) {
      evenNumbers.add(value);
    } else {
      oddNumbers.add(value);
    }
  }

  evenNumbers.sort();
  oddNumbers.sort((a, b) => b.compareTo(a));

  final buffer = StringBuffer();

  for (final value in evenNumbers) {
    buffer.writeln(value);
  }

  for (final value in oddNumbers) {
    buffer.writeln(value);
  }

  return buffer.toString();
}

void main() {
  final firstLine = stdin.readLineSync();
  if (firstLine == null) return;

  final count = int.tryParse(firstLine.trim());
  if (count == null || count <= 0) {
    return;
  }

  final values = <int>[];

  for (var i = 0; i < count; i++) {
    final line = stdin.readLineSync();
    if (line == null) break;

    final value = int.tryParse(line.trim());
    if (value == null) {
      continue;
    }

    values.add(value);
  }

  stdout.write(solve(values));
}

import 'package:dart_lab/beecrowd/level_4/1259/1259.dart';
import 'package:test/test.dart';

void main() {
  test('deve ordenar pares crescentes e ímpares decrescentes', () {
    final values = [4, 32, 34, 543, 3456, 654, 567, 87, 6789, 98];

    expect(
      solve(values),
      '4\n'
      '32\n'
      '34\n'
      '98\n'
      '654\n'
      '3456\n'
      '6789\n'
      '567\n'
      '543\n'
      '87\n',
    );
  });
}

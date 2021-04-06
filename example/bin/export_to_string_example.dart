import 'package:list_operators/list_operators.dart';

void main() {
  final a = [1, 2, 3];

  /// Exporting numerical lists to a `String` object.
  print('Exporting lists to String:');
  print(a.export(
    label: '<<Sample label>>',
    delimiter: ', ',
    precision: 4,
  ));

  print('Exporting an object of type List<List<num>> to String:');
  print('Each inner list is exported as a row.');
  print([
    [1, 2, 3],
    [101, 102, 103]
  ].export(label: '<<Sample label>>', precision: 6));

  print('Exporting an object of type List<List<num>> to String.');
  print('Inner lists are exported as columns.');
  print([
    [1, 2, 3],
    [101, 102, 103]
  ].export(
    label: '<<Sample label>>',
    precision: 6,
    flip: true,
  ));
}

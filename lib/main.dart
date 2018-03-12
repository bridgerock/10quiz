import 'dart:math';

import 'answer_generator.dart';
import 'rules.dart';

void main() {
  var max = pow(4, 10);
  var gen = new AnswerGenerator();
  var rules = new Rules();
  var c = 0;
  var out;
  for (int i = 0; i < max; i++) {
    var ans = gen.next();
    var ok = rules.check(ans);
    if (ok) {
      c++;
      out = ans;
    }
  }
  print('$c answers left');
  print('answer is $out');
  print('done');
}
/// Enumerates answers for the 10 questions in the format of 
/// base-4 int array. For each element,
/// 0 means A
/// 1 means B
/// 2 means C
/// 3 means D
class AnswerGenerator {
  final _zero = '0'.codeUnitAt(0);
  int _current = 0;
  
  /// Generates an answer or throw exception if 
  /// all answers have been generated.
  List<int> next() {
    var str = _current.toRadixString(4);
    _current++;
    if (str.length > 10) {
      throw new Exception('no no no');
    }
    while (str.length < 10) {
      str = '0$str';
    }
    return _toList(str);
  }

  List<int> _toList(String str) {
    var result = [];
    for (int i = 0; i < str.length; i++) {
      var char = str.codeUnitAt(i) - _zero;
      result.add(char);
    }
    return result;
  }
}

/// A class to validate an answer with the 10 questions.
///
/// Only answer that passes in all the the 10 questions 
/// can pass the check.
class Rules {
  const Rules();

  bool check(List<int> ans) {
    // The order of the rules are heuristic judged by
    // intuition :-).
    // Ideally, we want the rules that illuminate
    // most answers to be checked first.
    var rules = [
      _rule9,
      _rule6,
      _rule7,
      _rule2,
      _rule3,
      _rule4,
      _rule5,
      _rule8,
      _rule10,
      _rule1,
    ];
    for (var rule in rules) {
      if (!rule(ans)) return false;
    }
    return true;
  }

  bool _rule1(List<int> ans) {
    return true;
  }

  bool _rule2(List<int> ans) {
    switch (ans[1]) {
      case 0:
        return ans[4] == 2;
      case 1:
        return ans[4] == 3;
      case 2:
        return ans[4] == 0;
      case 3:
        return ans[4] == 1;
    }
    return false;
  }

  bool _rule3(List<int> ans) {
    switch (ans[2]) {
      case 0:
        return ans[2] != ans[5] &&
            ans[5] == ans[1] &&
            ans[1] == ans[3] &&
            ans[3] != ans[2];
      case 1:
        return ans[2] != ans[5] &&
            ans[5] != ans[1] &&
            ans[1] == ans[3] &&
            ans[3] == ans[2];
      case 2:
        return ans[2] == ans[5] &&
            ans[5] != ans[1] &&
            ans[1] != ans[3] &&
            ans[3] == ans[2];
      case 3:
        return ans[2] == ans[5] &&
            ans[5] == ans[1] &&
            ans[1] != ans[3] &&
            ans[3] != ans[2];
    }
    return false;
  }

  bool _rule4(List<int> ans) {
    switch (ans[3]) {
      case 0:
        return ans[0] == ans[4] &&
            ans[1] != ans[6] &&
            ans[0] != ans[8] &&
            ans[5] != ans[9];
      case 1:
        return ans[0] != ans[4] &&
            ans[1] == ans[6] &&
            ans[0] != ans[8] &&
            ans[5] != ans[9];
      case 2:
        return ans[0] != ans[4] &&
            ans[1] != ans[6] &&
            ans[0] == ans[8] &&
            ans[5] != ans[9];
      case 3:
        return ans[0] != ans[4] &&
            ans[1] != ans[6] &&
            ans[0] != ans[8] &&
            ans[5] == ans[9];
    }
    return false;
  }

  bool _rule5(List<int> ans) {
    var me = ans[4];
    switch (me) {
      case 0:
        return ans[7] == me && ans[3] != me && ans[8] != me && ans[6] != me;
      case 1:
        return ans[7] != me && ans[3] == me && ans[8] != me && ans[6] != me;
      case 2:
        return ans[7] != me && ans[3] != me && ans[8] == me && ans[6] != me;
      case 3:
        return ans[7] != me && ans[3] != me && ans[8] != me && ans[6] == me;
    }
    return false;
  }

  bool _rule6(List<int> ans) {
    var me = ans[5];
    var p1 = ans[1] == ans[3] && ans[3] == ans[7];
    var p2 = ans[0] == ans[5] && ans[5] == ans[7];
    ;
    var p3 = ans[2] == ans[9] && ans[9] == ans[7];
    var p4 = ans[4] == ans[8] && ans[8] == ans[7];
    switch (me) {
      case 0:
        return p1 && !p2 && !p3 && !p4;
      case 1:
        return !p1 && p2 && !p3 && !p4;
      case 2:
        return !p1 && !p2 && p3 && !p4;
      case 3:
        return !p1 && !p2 && !p3 && p4;
    }
    return false;
  }

  int _countOf(List<int> ans, int option) {
    var c = 0;
    for (var a in ans) {
      if (a == option) c++;
    }
    return c;
  }

  bool _rule7(List<int> ans) {
    var c0 = _countOf(ans, 0);
    var c1 = _countOf(ans, 1);
    var c2 = _countOf(ans, 2);
    var c3 = _countOf(ans, 3);
    switch (ans[6]) {
      case 0:
        return c2 < c1 && c2 < c0 && c2 < c3;
      case 1:
        return c1 < c0 && c1 < c2 && c1 < c3;
      case 2:
        return c0 < c1 && c0 < c2 && c0 < c3;
      case 3:
        return c3 < c1 && c3 < c2 && c3 < c0;
    }
    return false;
  }

  // todo check unique
  bool _rule8(List<int> ans) {
    var p1 = ans[6] - ans[0] > 1 || ans[6] - ans[0] < -1;
    var p2 = ans[4] - ans[0] > 1 || ans[4] - ans[0] < -1;
    var p3 = ans[1] - ans[0] > 1 || ans[1] - ans[0] < -1;
    var p4 = ans[9] - ans[0] > 1 || ans[9] - ans[0] < -1;
    switch (ans[7]) {
      case 0:
        return p1 && !p2 && !p3 && !p4;
      case 1:
        return !p1 && p2 && !p3 && !p4;
      case 2:
        return !p1 && !p2 && p3 && !p4;
      case 3:
        return !p1 && !p2 && !p3 && p4;
    }
    return false;
  }

  bool _rule9(List<int> ans) {
    var p1 = ans[4] == ans[5];
    var p2 = ans[4] == ans[9];
    var p3 = ans[4] == ans[1];
    var p4 = ans[4] == ans[8];
    var p0 = ans[0] == ans[5];
    switch (ans[8]) {
      case 0:
        return p0 && !p1 || !p0 && p1;
      case 1:
        return p0 && !p2 || !p0 && p2;
      case 2:
        return p0 && !p3 || !p0 && p3;
      case 3:
        return p0 && !p4 || !p0 && p4;
    }
    return false;
  }

  bool _rule10(List<int> ans) {
    var c0 = _countOf(ans, 0);
    var c1 = _countOf(ans, 1);
    var c2 = _countOf(ans, 2);
    var c3 = _countOf(ans, 3);
    var min = 10;
    var max = 0;
    for (var c in [c0, c1, c2, c3]) {
      if (c > max) max = c;
      if (c < min) min = c;
    }

    switch (ans[9]) {
      case 0:
        return max - min == 3;
      case 1:
        return max - min == 2;
      case 2:
        return max - min == 4;
      case 3:
        return max - min == 1;
    }
    return false;
  }
}


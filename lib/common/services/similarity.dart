import 'dart:math';

double jaroWinklerSimilarity(String s1, String s2) {
  // Preprocess strings by removing spaces and converting to lowercase
  final processedS1 = s1.replaceAll(' ', '').toLowerCase();
  final processedS2 = s2.replaceAll(' ', '').toLowerCase();

  final jaroScore = jaroSimilarity(processedS1, processedS2);
  final commonPrefixLength = _commonPrefixLength(processedS1, processedS2);

  // Adjust for common prefix
  final jaroWinklerScore =
      jaroScore + (commonPrefixLength * 0.1 * (1 - jaroScore));

  return jaroWinklerScore;
}

double jaroSimilarity(String s1, String s2) {
  final m = s1.length;
  final n = s2.length;

  if (m == 0 && n == 0) {
    return 1.0; // Both strings are empty, so they're completely similar
  }

  final matchDistance = (max(m, n) ~/ 2) - 1;
  final matches1 = List<bool>.filled(m, false);
  final matches2 = List<bool>.filled(n, false);
  var matchesCount = 0;

  for (var i = 0; i < m; i++) {
    final start = max(0, i - matchDistance);
    final end = min(n, i + matchDistance + 1);

    for (var j = start; j < end; j++) {
      if (!matches2[j] && s1[i] == s2[j]) {
        matches1[i] = true;
        matches2[j] = true;
        matchesCount++;
        break;
      }
    }
  }

  if (matchesCount == 0) {
    return 0.0; // No matches, similarity is 0
  }

  var transpositions = 0;
  var k = 0;

  for (var i = 0; i < m; i++) {
    if (matches1[i]) {
      while (!matches2[k]) {
        k++;
      }
      if (s1[i] != s2[k]) {
        transpositions++;
      }
      k++;
    }
  }

  return ((matchesCount / m) +
          (matchesCount / n) +
          ((matchesCount - transpositions / 2) / matchesCount)) /
      3;
}

int _commonPrefixLength(String s1, String s2) {
  final minLength = min(s1.length, s2.length);

  for (var i = 0; i < minLength; i++) {
    if (s1[i] != s2[i]) {
      return i;
    }
  }

  return minLength;
}

// ignore_for_file: slash_for_doc_comments

import 'core/rules.dart';
import 'core/game.dart';
import 'utils/terminal.dart';

/**
 * Author: Victor Hugo da Silva;
 * RA: 1431432312001
 * 
 */

// IMPORTANTE: Caso esteja enfrentando problemas para rodar a CLI
// Leia o arquivo README.md na raiz desse projeto.

void main() {
  clearScreen();

  print("|================|");
  print("|=== Game NIM ===|");
  print("|================|\n");

  try {
    var (total, max) = getRulesForRound();
    Nim round1 = Nim(n: total, m: max);
    round1.start();
  } catch (error) {
    print(error);
  }
}

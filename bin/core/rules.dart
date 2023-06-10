import 'dart:io' show stdin, stdout;

/// Retorna um [Record] que inclue dois valores
///
/// 1. O primeiro é o número de peças no tabuleiro (n: [int]).
/// 2. O segundo é o número máximo de peças que podem ser removidas (m: [int]).
///
/// emite uma [Exception] Em caso de inserções inválidades, é emitido uma exceção.
/// Essa essa exceção ocorre em dois casos:
///
/// 1. Caso n e n sejam 0 (o que inclui inserir letras ao invés de números).
/// 2. n seja maior que m, ou seja, o número máximo de remoção seja maior que
/// o número inicial de peças.

(int n, int m) getRulesForRound() {
  int n = 0;
  int m = 0;

  stdout.write("Insira o número inicial de peças (n): ");
  n = int.tryParse(stdin.readLineSync().toString().trim()) ?? 0;
  stdout.write("Insira o número máximo para remoção de peças (m): ");
  m = int.tryParse(stdin.readLineSync().toString().trim()) ?? 0;

  if (n == 0 || m == 0) {
    throw Exception("'n' e 'm' devem ser maior que 0\n");
  } else if (m > n) {
    throw Exception("'n' deve ser maior que o 'm'\n");
  }

  return (n, m);
}

import 'dart:io';
import 'dart:math';

import '../utils/terminal.dart';

enum Turn { machine, player }

/// Nim é a clase principal para organização da lógica do jogo NIM.
/// Sua instância requere dois valores passados para o construtor, sendo n e m.
/// Ambos são valores inteiros que representam o número de peças, e o número máximo
/// de peças que podem ser removidas, respectivamente.
///
/// Nessa clase temos o ponto de entrada sendo o [start], que utilizará de n e m
/// para executar fluxo condicionais. Caso a máquina faça a primeira jogada,
/// é executado a função [_machineRound] caso contrário é executado a função [_playerRound]

class Nim {
  int n;
  final int m;

  int rounds = 0;
  Turn turn = Turn.machine;

  Nim({required this.n, required this.m});

  /// Ponto de entrada para execução do jogo NIM.
  void start() {
    _showRules();

    final bool multiple = n % (m + 1) == 0;

    if (multiple) {
      print("😃 Você começa...\n");
      turn = Turn.player;
    } else {
      print("💻 Computador começa...\n");
      turn = Turn.machine;
    }

    while (n > 0) {
      if (turn == Turn.machine) {
        int amount = _machineRound(n, m);
        n -= amount;
        turn = Turn.player;
      } else {
        int amount = _playerRound(n, m);
        n -= amount;
        turn = Turn.machine;
      }

      rounds++;
    }

    _announceWinner();
  }

  /// Função que obtém recebe dois argumentos inteiros [n] e [m] e retorna o número
  /// de peças removidas pela máquina.
  int _machineRound(int n, int m) {
    int? amount;

    int guess = n % (m + 1);

    if (guess == 0 || guess == 1) {
      amount = max(1, m);
    } else {
      amount = guess - 1;
    }

    String dots = '.';

    for (int i = 0; i <= 3; i++) {
      stdout.write('\rcomputador (n: $n) -> ${i == 3 ? amount : dots}');
      sleep(Duration(seconds: 1));
      if (i < 3) stdout.write("\r${' ' * stdout.terminalColumns}");
      dots += ".";
    }

    // Quebrando linha após obter resultado da máquina de forma animada.
    stdout.writeln("");

    return amount;
  }

  /// Função que obtém recebe dois argumentos inteiros [n] e [m] e retorna o número
  /// de peças removidas pelo jogador.
  int _playerRound(int n, int m) {
    int amount = 0;

    while (amount == 0) {
      stdout.write("sua vez (n: $n) -> ");
      int? input = int.tryParse(stdin.readLineSync().toString().trim());

      if (input != null && input > 0 && input <= m) {
        amount = input;
      }
    }

    return amount;
  }

  /// Anuncia o vencedor
  void _announceWinner() {
    print("\n🎉 Resultado 🎉\n");
    if (turn == Turn.machine) {
      print("| Vencedor: ✨ 💻 Computador ✨");
    } else {
      print("| Vencedor: ✨ 😃 Você ✨");
    }
    print("| Jogadas: $rounds\n");
  }

  /// Limpa o terminal e exibe as regras atuais da partida.
  void _showRules() {
    clearScreen();

    String n = this.n.toString().padLeft(2, '0');
    String m = this.m.toString().padLeft(2, '0');

    print("| Regras ↘");
    print("| Número inicial de peças (n): $n");
    print("| Número máximo de remoção (m): $m\n");
  }
}

import 'dart:io';

final moves = ['rock', 'paper', 'scissors'];

/// Gets the player's name.
String getName(String player) {
  stdout.write('Enter $player name: ');
  String? input = stdin.readLineSync();

  return (input ?? '').trim().isEmpty ? player : input!.trim();
}

/// Checks if the move is valid.
String? checkMove(String? input) {
  String move = (input ?? '').trim().toLowerCase();

  return moves.contains(move) ? move : null;
}

/// Gets a valid move from the player.
String getMove(String player) {
  while (true) {
    stdout.write('$player, enter your move (rock/paper/scissors): ');

    String? input = stdin.readLineSync();
    String? move = checkMove(input);

    if (move != null) {
      return move;
    }

    print('Invalid move. Please type rock, paper, or scissors.');
  }
}

/// Finds the winner of the round.
String? getWinner(String move1, String move2) {
  if (move1 == move2) {
    return null;
  }

  if ((move1 == 'rock' && move2 == 'scissors') ||
      (move1 == 'paper' && move2 == 'rock') ||
      (move1 == 'scissors' && move2 == 'paper')) {
    return 'Player 1';
  }

  return 'Player 2';
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String player1 = getName('Player 1');
  String player2 = getName('Player 2');

  int score1 = 0;
  int score2 = 0;
  int round = 1;
  String again;

  do {
    print('\n--- Round $round ---');

    String move1 = getMove(player1);

    // Hide Player 1's move.
    for (int i = 0; i < 30; i++) {
      print('');
    }

    String move2 = getMove(player2);
    String? winner = getWinner(move1, move2);

    print('$player1 chose $move1. $player2 chose $move2.');

    if (winner == null) {
      print('Result: It\'s a draw!');
    } else if (winner == 'Player 1') {
      score1++;
      print('Result: $player1 wins the round!');
    } else {
      score2++;
      print('Result: $player2 wins the round!');
    }

    print('Score -> $player1: $score1 | $player2: $score2');

    stdout.write('Play again? (y/n): ');
    again = (stdin.readLineSync() ?? 'n').trim().toLowerCase();

    round++;
  } while (again == 'y');

  print('\n===== FINAL SCORE =====');
  print('$player1: $score1 | $player2: $score2');

  if (score1 == score2) {
    print('Overall winner: It\'s a draw!');
  } else if (score1 > score2) {
    print('Overall winner: $player1');
  } else {
    print('Overall winner: $player2');
  }
}
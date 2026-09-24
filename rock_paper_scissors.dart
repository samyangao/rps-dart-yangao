import 'dart:io';

final List<String> choices = ['rock', 'paper', 'scissors'];

String getName(String player) {
   stdout.write('Enter $player name: ');
   String? input = stdin.readLineSync();
   return input ?? 'Unknown Player';
} 
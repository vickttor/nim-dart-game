import 'dart:io';

import 'package:ansi_escapes/ansi_escapes.dart';

void clearScreen() {
  stdout.write(ansiEscapes.clearScreen);
}

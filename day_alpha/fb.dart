import 'package:flutter/foundation.dart';
import 'package:markdown/markdown.dart';

class FilledStackSyntax extends DelimiterSyntax {
  final String newText;
  final String fadeDuration;
  FilledStackSyntax(this.newText, {this.fadeDuration = "2000"})
      : super(
          '~+',
          requiresDelimiterRun: true,
          allowIntraWord: true,
          startCharacter: 0x7E,
          tags: [DelimiterTag('a', 1)],
          // tags: [DelimiterTag('hr', 1)],// chat gpt line dot to bar
        ) {
    debugPrint(
      RegExp.escape(newText),
    );
  }
}

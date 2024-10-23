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
          tags: [DelimiterTag('del', 1)],
        ) {
    debugPrint(
      RegExp.escape(newText),
    );
  }

  @override
  bool onMatch(InlineParser parser, Match match) {
    // final newElement = Element.withTag('span');
    // newElement.attributes['class'] = 'fade'; // add 'fade' class for the span
    // newElement.attributes['data-fade-duration'] =
    //     fadeDuration; // add custom fade duration attribute
    // parser.addNode(newElement);
    return super.onMatch(parser, match);}}

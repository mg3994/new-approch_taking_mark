import 'package:markdown/markdown.dart';

class FilledStackSyntaxs extends InlineSyntax {
  final String newText;
  final String fadeDuration;

  // Constructor for custom inline syntax
  FilledStackSyntaxs(this.newText,
      {this.fadeDuration = "2000", super.startCharacter = 0xA7})
      : super(r'§(.+?)§'); // regex to match text between § symbols

  @override
  bool onMatch(InlineParser parser, Match match) {
    // Retrieve the content between the § symbols
    final originalContent = match[1]!;

    // Print the content for debug purposes (optional)
    debugPrint('Original Content: $originalContent');

    // Create a new text node with `newText`
    final element = Element.text('filledstack', newText);
    element.attributes['fadeDuration'] = fadeDuration;

    // Add the new node to the parser's document tree
    parser.addNode(element);

    return true; // indicates a successful match and replacement
  }
}

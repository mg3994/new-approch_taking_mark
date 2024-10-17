# new-approch_taking_mark

wrap you txt or data in tags 

```markdown
<ins>Underlined text</ins>
```
```dart
 builders: {
 'ul': DaneBuilder()
 },
 inlineSyntaxes: [
  DaneSyntax(), ],

```dart
class DaneBuilder extends renderer.MarkdownElementBuilder {
  @override
  Widget visitText(markdown.Text text, TextStyle? preferredStyle) {
    return MarkdownBody(
      data: text.textContent,
    ).animate().fade();
 }
}
```
or
```dart
class DaneBuilder extends renderer.MarkdownElementBuilder {
  @override
  Widget visitText(markdown.Text text, TextStyle? preferredStyle) {
    return _AnimatedMarkdown(text: text.textContent);
  }
}

class _AnimatedMarkdown extends StatefulWidget {
  final String text;

  const _AnimatedMarkdown({Key? key, required this.text}) : super(key: key);

  @override
  _AnimatedMarkdownState createState() => _AnimatedMarkdownState();
}

class _AnimatedMarkdownState extends State<_AnimatedMarkdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration for the fade effect
      vsync: this,
    );

    // Create an animation for opacity
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: MarkdownBody(
        data: widget.text,
      ),
    );
  }
}
```
```dart
class DaneSyntax extends markdown.InlineSyntax {
  UnderlineSyntax() : super(r'''<ins>(.*?)</ins>''');

  @override
  bool onMatch(markdown.InlineParser parser, Match match) {
    final underlineElement = markdown.Element.text('ul', match.group(1)!);
    parser.addNode(underlineElement);
    return true;
  }
}
```

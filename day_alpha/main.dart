import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

import 'custom/fb.dart';

class FadingMarkdownDifference extends StatefulWidget {
  const FadingMarkdownDifference({super.key});

  @override
  State<FadingMarkdownDifference> createState() =>
      _FadingMarkdownDifferenceState();
}

class _FadingMarkdownDifferenceState extends State<FadingMarkdownDifference>
    with SingleTickerProviderStateMixin {
  final List<String> markdownVersions = [
    "## Problem\nThis is the main issue with what",
    "## Problem\nThis is the main issue with what we're trying to solve.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases,",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members. The system should be regularly audited for security vulnerabilities to ensure data protection.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members. The system should be regularly audited for security vulnerabilities to ensure data protection. The system should also be designed to comply with relevant regulations and standards.",
    "## Problem\nThis is the main issue with what we're trying to solve. The current solution is insufficient for handling edge cases, and it leads to frequent breakdowns in production. As a result, customer satisfaction has dropped significantly. We need a more robust solution that can handle these edge cases effectively. This will require a complete overhaul of the system. The new system should be designed with scalability and reliability in mind. Additionally, it should be user-friendly and easy to maintain. The development team should also consider implementing automated testing to ensure the system's stability. Regular user feedback should be collected to continuously improve the system. The project should be managed using agile methodologies to ensure flexibility and adaptability. The team should also focus on documentation and knowledge sharing to ensure smooth onboarding of new team members. The system should be regularly audited for security vulnerabilities to ensure data protection. The system should also be designed to comply with relevant regulations and standards. The system should be regularly updated to incorporate the latest technologies ~and best practices~", //i am facing issue as at last it makes 2 copies
  ];

  String previousText = "";
  String currentText = "";
  String newText = "";

  @override
  void initState() {
    super.initState();

    // Initialize text and animation for the first version
    _updateText(0);
  }

  void _updateText(int versionIndex) {
    if (versionIndex < 0 || versionIndex >= markdownVersions.length) return;

    setState(() {
      previousText = versionIndex > 0 ? markdownVersions[versionIndex - 1] : "";
      currentText = markdownVersions[versionIndex];
      newText = _findNewText(previousText, currentText);
    });
  }

  // Compare previous and current text to return the newly added portion
  String _findNewText(String oldText, String newText) {
    if (oldText == newText) return "";
    return newText.substring(oldText.length); // Get new text after old text
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fading Markdown Difference Effect"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: MarkdownBody(
                // builders: {
                //   "span": FadeElementBuilder(),
                // },
                inlineSyntaxes: [
                  FilledStackSyntax(newText),
                  // FontColorSyntax(),
                ], //make it fading
                data: previousText +
                    (newText.startsWith(" ")
                        ? " ~" + newText.trim()
                        : '~' + newText) +
                    (newText.endsWith(" ") ? newText.trim() + '~ ' : '~'),

                styleSheet: MarkdownStyleSheet(
                  h2: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  p: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Move to the next version and restart the animation
          int nextIndex = (markdownVersions.indexOf(currentText) + 1) %
              markdownVersions.length;
          _updateText(nextIndex);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: FadingMarkdownDifference(),
    ));

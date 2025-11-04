import 'package:biblia/models/biblia_current_screen.dart';
import 'package:biblia/viewmodels/biblia_viewmodel.dart';
import 'package:biblia/widgets/book_selector.dart';
import 'package:biblia/widgets/chapter_selector.dart';
import 'package:biblia/widgets/verse_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BibliaScreen extends StatefulWidget {
 const BibliaScreen({super.key});

  @override
  State<BibliaScreen> createState() => _BibliaScreenState();
}

class _BibliaScreenState extends State<BibliaScreen> {
  Widget screen = SizedBox();

  @override
  Widget build(BuildContext context) {
    final biblia = Provider.of<BibliaViewModel>(context);

    switch (biblia.currentScreen) {
      case BibliaCurrentScreen.bookSelector:
        screen = BookSelector();
        break;
      case BibliaCurrentScreen.chapterSelector:
        screen = ChapterSelector();
        break;
      case BibliaCurrentScreen.verseSelector:
        screen = VerseSelector();
        break;
    }

    return Consumer<BibliaViewModel>(
      builder: (cotext, biblia, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          biblia.mudeATela();
                        }, 
                        child: Text('Mude a tela'),
                        ),
                      Expanded(child: screen),
                    ],
                  )
                )
              ),
            ),
          ),
        );
      }
    );
  }
}
import 'package:biblia/screens/reader_screen.dart';
import 'package:biblia/viewmodels/biblia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseSelector extends StatelessWidget {
  const VerseSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BibliaViewModel>(
      builder: (cotext, biblia, child) {
        return SingleChildScrollView(
           child: Column(
            children: [
              Text(
                '${biblia.currentSelected.bookName} ${biblia.currentSelected.chapterNumber}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
          
              SizedBox(
                height: 10
              ),
          
              Center(
                child: Column(
                  children: [
                    for (var i = 0; i < biblia.verses.length; i++)
                      SizedBox(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ReaderScreen(),
                                  ),
                                ),
                              },
                              child: Text(
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                biblia.verses[i].toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
           ),
        );
      }
    );
  }
}
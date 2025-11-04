import 'package:biblia/viewmodels/biblia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterSelector extends StatelessWidget {
  const ChapterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BibliaViewModel>(
      builder: (cotext, biblia, child) {
        return SingleChildScrollView(
           child: Column(
            children: [
              Text(
                biblia.currentSelected.bookName,
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
                    for (var i = 0; i < biblia.chapters.length; i++)
                      SizedBox(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                biblia.goToVerseSelector(biblia.chapters[i]),
                              },
                              child: Text(
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                biblia.chapters[i].toString(),
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
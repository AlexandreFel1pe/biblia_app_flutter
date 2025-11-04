import 'package:biblia/viewmodels/biblia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookSelector extends StatelessWidget {
  const BookSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BibliaViewModel>(
      builder: (cotext, biblia, child) {
        return SingleChildScrollView(
           child: Column(
            children: [
              Text(
                'Bíblia',
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
                    for (var i = 0; i < biblia.livros.length; i++)
                      SizedBox(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                biblia.goToChapterSelector(biblia.livros[i]),
                              },
                              child: Text(
                                biblia.livros[i]
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
import 'package:biblia/viewmodels/biblia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCardList extends StatelessWidget {
  const BookCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BibliaViewModel>(
      builder: (cotext, biblia, child) {
        return SingleChildScrollView(
           child: Column(
            children: [
              Text(
                'Livros',
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
                    if (biblia.getBibliaIsLoaded)
                      for (var i = 0; i < biblia.livros.length; i++)
                        Text(
                          biblia.livros[i]
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
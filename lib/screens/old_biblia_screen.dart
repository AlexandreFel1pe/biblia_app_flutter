import 'package:biblia/viewmodels/old_biblia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OldBibliaScreen extends StatelessWidget {
 const OldBibliaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Directionality(
              textDirection: TextDirection.ltr, 
              child: Column(
                children: [
                  AddBookCard(),
      
                  SizedBox(height: 30),

                  Expanded(child: bookListCard()),
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}

class AddBookCard extends StatelessWidget {
  AddBookCard({super.key});
  
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<OldBibliaViewModel>(
        builder: (context, biblia, child) {
          return SizedBox(
            width: 500,
            child: Column(
              children: [
                TextFormField(
                  key: key,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    label: Center(
                      child: Text('Escreva o nome do livro'),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (value) => {
                    if (_textEditingController.text.isNotEmpty) {
                      biblia.addLivro(value),
                      _textEditingController.clear(),
                    }
                  }
                ),

                SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      biblia.addLivro(_textEditingController.text);
                      _textEditingController.clear();
                    }
                  }, 
                  child: Text('Adicionar livro')
                ),
              ],
            )
          );
        },
    );
  }
}

// ignore: camel_case_types
class bookListCard extends StatelessWidget {
  const bookListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OldBibliaViewModel>(
      builder: (cotext, biblia, child) {
        return SingleChildScrollView(
          child: SizedBox(
           child: Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Livros',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
          
                    SizedBox(width: 10),
          
                    ElevatedButton.icon(
                      onPressed: () {
                        biblia.livrosClear();
                      }, 
                      label: Text("Excluir tudo"),
                      icon: Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              ),
          
              SizedBox(
                height: 10
              ),
          
              Column(
                children: [
                    for (var i = 0; i < biblia.livros.length; i++)
                      Dismissible(
                        key: Key(biblia.livros[i]),
              
                        child: SizedBox(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(biblia.livros[i]),
                        
                                TextButton(
                                  onPressed: () {
                                    biblia.removeLivro(biblia.livros[i]);
                                  },
                                  child: Icon(Icons.delete_outline),
                                ),
                              ],
                            ),
                          ),
                        ),
              
                      onDismissed: (value) => {
                        biblia.removeLivro(biblia.livros[i]),
                      }
                    ),
                ],
              ),
            ],
           ),
          ),
        );
      }
    );
  }
}
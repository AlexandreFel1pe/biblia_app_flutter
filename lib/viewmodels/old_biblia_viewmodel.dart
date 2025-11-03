import 'dart:collection';

import 'package:flutter/material.dart';

class OldBibliaViewModel extends ChangeNotifier {
  final List<String> _livros = ['Mateus', 'João', 'Marcos', 'Lucas'];

  UnmodifiableListView<String> get livros => UnmodifiableListView(_livros.reversed);

  void addLivro(String livro) {
    _livros.add(livro);
    notifyListeners();
  }

  void removeLivro(String livro) {
    _livros.remove(livro);
    notifyListeners();
  }

  void livrosClear() {
    _livros.clear();
    notifyListeners();
  }
}
import 'dart:collection';
import 'package:biblia/repositories/biblia_repository.dart';
import 'package:flutter/material.dart';

class BibliaViewModel extends ChangeNotifier {
  BibliaViewModel({required BibliaRepository bibliaRepository}) : _bibliaRepository = bibliaRepository {
    loadBiblia();
  }

  late final BibliaRepository _bibliaRepository;
  
  UnmodifiableListView<String> get livros => UnmodifiableListView(_livros.reversed);

  List<String> _livros = [];
  //Biblia? biblia;

  bool _bibliaIsLoaded = false;

  bool get getBibliaIsLoaded {
    return _bibliaIsLoaded;
  }

  set bibliaIsLoaded(bool isLoaded) {
    _bibliaIsLoaded = isLoaded;
    notifyListeners();
  }

  void loadBiblia() async {
    _livros = await _bibliaRepository.getBooksNames();

    if(_livros.isNotEmpty) {
      bibliaIsLoaded = true;
    }
  }
}
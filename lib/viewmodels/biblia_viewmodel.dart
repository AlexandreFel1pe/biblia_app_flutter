import 'dart:collection';
import 'package:biblia/models/biblia_current_screen.dart';
import 'package:biblia/models/biblia_selected.dart';
import 'package:biblia/repositories/biblia_repository.dart';
import 'package:flutter/material.dart';

class BibliaViewModel extends ChangeNotifier {
  BibliaViewModel({required BibliaRepository bibliaRepository}) : _bibliaRepository = bibliaRepository {
    goToBookSelector();
  }

  late final BibliaRepository _bibliaRepository;
  
  List<String> _livros = [];
  UnmodifiableListView<String> get livros => UnmodifiableListView(_livros);

  List<int> _chapters = [];
  get chapters {
    return _chapters;
  }

  List<int> _verses = [];
  get verses {
    return _verses;
  }

  BibliaCurrentScreen currentScreen = BibliaCurrentScreen.bookSelector;
  BibliaSelected currentSelected = BibliaSelected();

  void goToBookSelector() async {
    currentScreen = BibliaCurrentScreen.bookSelector;
    _livros = await _bibliaRepository.getBooksNames();

    notifyListeners();
  }

  void goToChapterSelector(String bookName) async {
    currentScreen = BibliaCurrentScreen.chapterSelector;
    currentSelected.bookName = bookName;

    _chapters = await _bibliaRepository.getChapters(currentSelected.bookName);
    print(bookName);

    notifyListeners();
  }

  void goToVerseSelector(int chapterNumber) async {
    currentScreen = BibliaCurrentScreen.verseSelector;
    currentSelected.chapterNumber = chapterNumber;

    _verses = await _bibliaRepository.getVerses(currentSelected.bookName, currentSelected.chapterNumber);

    print(chapterNumber);

    notifyListeners();
  }

  void mudeATela() {
    if (currentScreen == BibliaCurrentScreen.bookSelector) {
      currentScreen = BibliaCurrentScreen.chapterSelector;
    }
    else {
      currentScreen = BibliaCurrentScreen.bookSelector;
    }

    print(currentScreen);

    notifyListeners();
  }
}
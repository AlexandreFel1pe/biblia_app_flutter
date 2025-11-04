import 'package:biblia/services/biblia_json_service.dart';
import 'package:biblia/services/models/biblia_service_model.dart';

class BibliaRepository {
  BibliaRepository({required BibliaJsonService bibliaJsonService}) : _bibliaJsonService = bibliaJsonService;

  final BibliaJsonService _bibliaJsonService;

  Future<List<String>> getBooksNames() async {
    Biblia biblia = await _bibliaJsonService.loadBiblia();

    List<String> booksNames = [];

    for (var book in biblia.livro) {
      booksNames.add(book.nomeLivro);
    }

    return booksNames;
  }

  Future<List<int>> getChapters(String bookName) async {
    Biblia biblia = await _bibliaJsonService.loadBiblia();
    List<int> chapters = [];

    for (var book in biblia.livro) {
      if (book.nomeLivro == bookName) {
        for (var chapter in book.capitulo) {
          chapters.add(chapter.numeroCapitulo);
        }

        return chapters;
      }
    }

    return List.empty();
  }

  Future<List<int>> getVerses(String bookName, int chpaterNumber) async {
    Biblia biblia = await _bibliaJsonService.loadBiblia();
    List<int> verses = [];

    for (var book in biblia.livro) {
      if (book.nomeLivro == bookName) {
        for (var chapter in book.capitulo) {
          if (chapter.numeroCapitulo == chpaterNumber) {
            for (var verse in chapter.versiculo) {
              verses.add(verse.numeroVersiculo);
            }

            return verses;
          }
        }
      }
    }

    return List.empty();
  }
}
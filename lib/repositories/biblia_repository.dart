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
}
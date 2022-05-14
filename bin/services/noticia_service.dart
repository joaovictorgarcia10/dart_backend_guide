import '../models/noticia_model.dart';
import 'generic_service.dart';
import '../utils/extensions/list_extension.dart';

class NoticiaService implements GenericService<NoticiaModel> {
  List<NoticiaModel> _fakeDB = [];

  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<NoticiaModel> findAll() {
    return _fakeDB;
  }

  @override
  NoticiaModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(NoticiaModel noticia) {
    NoticiaModel? model = _fakeDB.firstWhereOrNull((e) => e.id == noticia.id);

    if (model == null) {
      _fakeDB.add(noticia);
    } else {
      var index = _fakeDB.indexOf(model);
      _fakeDB[index] = noticia;
    }

    return true;
  }
}

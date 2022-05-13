import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/generic_service.dart';

class BlogApi {
  final GenericService _service;
  BlogApi(this._service);

  Handler get handler {
    // http://localhost:8090/blog/noticias
    Router router = Router();

    // Listar Notícias
    router.get("/blog/noticias", (Request req) {
      _service.findAll();
      return Response.ok("Choveu Hoje");
    });

    // Adicionar Notícia
    router.post("/blog/noticias", (Request req) {
      //  _service.save("");
      return Response.ok("Choveu Hoje");
    });

    // Atualizar Notícia ->  http://localhost:8090/blog/noticias?id=1
    router.put("/blog/noticias", (Request req) {
      // _service.save("");
      //String? id = req.url.queryParameters["id"];
      return Response.ok("Choveu Hoje");
    });

    // Deletar Notícia ->  http://localhost:8090/blog/noticias?id=1
    router.delete("/blog/noticias", (Request req) {
      // _service.delete(1);
      //String? id = req.url.queryParameters["id"];
      return Response.ok("Choveu Hoje");
    });

    return router;
  }
}

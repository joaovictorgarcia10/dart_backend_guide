import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/noticia_model.dart';
import '../services/generic_service.dart';

class BlogApi {
  final GenericService<NoticiaModel> _service;
  BlogApi(this._service);

  // Base URL -> http://localhost:5556/blog/noticias
  Handler get handler {
    Router router = Router();

    // Listar Notícias
    router.get("/blog/noticias", (Request req) {
      List<NoticiaModel> noticias = _service.findAll();
      List<Map> noticiasMap = noticias.map((e) => e.toJson()).toList();

      return Response.ok(
        jsonEncode(noticiasMap),
      );
    });

    // Adicionar Notícia
    router.post("/blog/noticias", (Request req) async {
      var body = await req.readAsString();
      var bodyJson = jsonDecode(body);

      _service.save(NoticiaModel.fromJson(bodyJson));
      return Response(201);
    });

    // Atualizar Notícia ->  http://localhost:5556/blog/noticias?id=1
    router.put("/blog/noticias", (Request req) {
      // _service.save("");
      //String? id = req.url.queryParameters["id"];
      return Response.ok("Choveu Hoje");
    });

    // Deletar Notícia ->  http://localhost:5556/blog/noticias?id=1
    router.delete("/blog/noticias", (Request req) {
      // _service.delete(1);
      //String? id = req.url.queryParameters["id"];
      return Response.ok("Choveu Hoje");
    });

    return router;
  }
}

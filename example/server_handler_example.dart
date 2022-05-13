import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandlerExample {
  Handler get handler {
    final _router = Router();

    // http://localhost:8090/
    _router.get("/", (Request req) {
      return Response.ok(
        "<h1> Primeira Rota </h1>",
        headers: {
          "content-type": "text/html",
        },
      );
    });

    // http://localhost:8090/hello/world/USUARIO
    _router.get("/hello/world/<usuario>", (Request request, String usuario) {
      return Response(200, body: "Hello World $usuario!");
    });

    //Query Params ->  http://localhost:8090/query?nome=Joao&idade=21&profissao=Developer
    _router.get("/query", (Request request) {
      String? nome = request.url.queryParameters["nome"];
      String? idade = request.url.queryParameters["idade"];
      String? profissao = request.url.queryParameters["profissao"];

      return Response(
        200,
        body: """
        Usuário: $nome
        Idade: $idade
        Profissão: $profissao
        """,
      );
    });

    // http://localhost:8090/login
    _router.post("/login", (Request req) async {
      var result = await req.readAsString();
      Map<String, dynamic> json = jsonDecode(result);

      var usuario = json["usuario"];
      var senha = json["senha"];

      if (usuario == "admin" && senha == "123") {
        Map<String, dynamic> response = {"token": "token123", "userId": "1"};
        String jsonResponse = jsonEncode(response);

        return Response.ok(
          jsonResponse,
          headers: {"content-type": "application/json"},
        );
      } else {
        return Response.forbidden("Acesso negado");
      }
    });

    return _router;
  }
}

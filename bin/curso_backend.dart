import 'package:shelf/shelf.dart';
import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'apis/other_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'services/noticia_service.dart';
import 'utils/env/custom_env.dart';

main() async {
  // Sobrescreve o arquivo .env padrão
  //CustomEnv.fromFile(".env-dev");

  // Cascade Handler.
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi(NoticiaService()).handler)
      .add(OtherApi().handler)
      .handler;

  // Cria o Handler Pipeline adicionando o Middleware logRequests e chamando nosso Handler Cascade.
  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler((cascadeHandler));

  // Inicializa nosso servidor passando o Handler Pipeline e os demais parâmetros que vem do .env, utilizando nosso CustomEnv.
  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: "server_address"),
    port: await CustomEnv.get<int>(key: "server_port"),
  );
}

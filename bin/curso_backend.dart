import 'package:shelf/shelf.dart';
import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'api/other_api.dart';
import 'infra/custom_server.dart';

main() async {
  // Cascade
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi().handler)
      .add(OtherApi().handler)
      .handler;

  // Pipeline and Middleware
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler((cascadeHandler));

  await CustomServer().initialize(handler);
}

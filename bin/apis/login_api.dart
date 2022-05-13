import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class LoginApi {
  Handler get handler {
    Router router = Router();

    // http://localhost:8090/login
    router.post("/login", (Request req) {
      return Response.ok("Login API");
    });

    return router;
  }
}

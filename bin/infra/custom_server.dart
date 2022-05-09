import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initialize() async {
    String address = "localhost";
    int port = 8090;

    await shelf_io.serve((request) => , address, port);
    print("Servidor Inicializado -> http://$address:$port");
  }
}

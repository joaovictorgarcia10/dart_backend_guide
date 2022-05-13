import 'package:shelf/shelf_io.dart' as shelf_io;
import 'server_handler_example.dart';

Future<void> main() async {
  var _serverHandlerExample = ServerHandlerExample();

  // Criando o servidor HTTP
  await shelf_io.serve(_serverHandlerExample.handler, "localhost", 8090);
  print("Servidor Iniciado -> http://localhost:8080");
}

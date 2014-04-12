import 'dart:io';
import 'dart:convert';
 void main() {
   HttpServer.bind(InternetAddress.ANY_IP_V4, 8977)
     .then((HttpServer server) {
       server.listen((HttpRequest request) {
         if (request.method=="POST") {
           print('Webhook triggered at ' + new DateTime.now().toString());
           request.response.statusCode = 200;
           Process.start('deploy.sh', []).then((process) {
             process.stdout.transform(new Utf8Decoder())
                           .transform(new LineSplitter())
                           .listen((String line) => request.response.writeln(line));
             process.exitCode.then((exitCode) {
               request.response.writeln('Exit code = $exitCode');
               request.response.close();
             });
           });
         }
 });});}
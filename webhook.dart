import 'dart:io';
import 'dart:convert';
 void main() {
   HttpServer.bind(InternetAddress.ANY_IP_V4, 8977)
     .then((HttpServer server) {
       server.listen((HttpRequest request) {
         if (request.method=="POST") {
           print('Webhook triggered at ' + new DateTime.now().toString());
           Process.start('bash', ['deploy.sh'])  // <-- point to deployment script
             .then((process) {
                 request.response.statusCode = 200;
                 process.stdout.transform(new Utf8Decoder())
                               .transform(new LineSplitter())
                               .listen((String line) => request.response.writeln('stdout:  ' + line));
                 process.stderr.transform(new Utf8Decoder())
                               .transform(new LineSplitter())
                               .listen((String line) => request.response.writeln('stderr:  ' + line));
                 process.exitCode.then((exitCode) {
                   request.response.writeln('Exit code = $exitCode');
                   request.response.close();
                 });
               })
             .catchError((e) {
                 request.response.statusCode = 500;
                 request.response.writeln('ERROR');
                 request.response.writeln(e);
                 request.response.close();
               }); 
         }
		});
	});
	print('listing...');
}
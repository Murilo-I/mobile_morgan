import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:mobile_morgan/http/http_interceptor.dart';
import 'package:xml/xml.dart';

Future<List<String>> ultimasNoticias() async {
  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );

  Map<String, dynamic> param = {'hl': 'pt-BR&g=BR&ceid=BR:pt-419'};
  Response resp = await client.get(Uri.https('news.google.com', 'rss', param));

  var xmlNoticias = XmlDocument.parse(resp.body);
  var titles = xmlNoticias.findAllElements('title');
  List<String> noticias = [];
  titles.map((title) => title.text).forEach((element) => noticias.add(element));
  return noticias;
}

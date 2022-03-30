import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'interceptors/logging_interceptor.dart';

const uri = '192.168.1.15:8081';
const transactionsEndPoint = 'transactions';
final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

import 'package:test/test.dart';
import 'package:backend_api_client/backend_api_client.dart';

/// tests for DefaultApi
void main() {
  final instance = BackendApiClient().getDefaultApi();

  group(DefaultApi, () {
    // Get Foobar
    //
    //Future<FoobarResponse> getFoobarFoobarGet() async
    test('test getFoobarFoobarGet', () async {
      // TODO
    });
  });
}

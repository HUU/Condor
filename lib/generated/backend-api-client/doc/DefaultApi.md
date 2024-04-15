# backend_api_client.api.DefaultApi

## Load the API package
```dart
import 'package:backend_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**foobar**](DefaultApi.md#foobar) | **GET** /foobar | Foobar


# **foobar**
> FoobarResponse foobar()

Foobar

### Example
```dart
import 'package:backend_api_client/api.dart';

final api = BackendApiClient().getDefaultApi();

try {
    final response = api.foobar();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->foobar: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FoobarResponse**](FoobarResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


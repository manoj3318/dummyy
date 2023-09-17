import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SampleCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
    "customerId": 19,
    "gender": "Male",
    "locationPin": 400025,
    "existingInsurance": false,
    "existingpolicyType": null,
    "existingCoverage": 0,
    "super5": false,
    "super10": false,
    "super15": false,
    "sumInsured": 500000,
    "createdBy": "user",
    "modifiedBy": "user",
    "active": true,
    "selfAge": 25,
    "spouseAge": 0,
    "child1age": 0,
    "child2age": 0,
    "child3age": 0,
    "child4age": 0,
    "fatherAge": 0,
    "motherAge": 0,
    "fatherinlawage": 0,
    "motherinlawage": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sample',
      apiUrl:
          'http://34.100.198.4/abc-healthinsurance/healthinsurance/quoteDetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ArtNewsAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ArtNews API',
      apiUrl:
          'https://google-news22.p.rapidapi.com/v1/search?q=art&country=us&language=en',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-host': 'google-news22.p.rapidapi.com',
        'x-rapidapi-key': '6a05864282msh69d296f638ab1c6p198b01jsn72f1f0521e83',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? userEmail = '',
    String? eventName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${escapeStringForJson(userEmail)}"
        }
      ],
      "subject": "Your Ticket Confirmation"
    }
  ],
  "from": {
    "email": "haithem.abdellaoui@esprit.tn"
  },
  "content": [
    {
      "type": "text/html",
      "value": "<h2>Thank you for booking!</h2><p>Here’s your ticket:</p><p><b>Event:</b>${escapeStringForJson(eventName)}</p>"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmssendCall {
  static Future<ApiCallResponse> call({
    String? to = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'smssend',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts/AC5843303f90c15c86ef1b0d4e90b3b118/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic QUM1ODQzMzAzZjkwYzE1Yzg2ZWYxYjBkNGU5MGIzYjExODplMTQwMTRkOGFjMTE3NWIzZGU2MDZmODhhMTkxMzdmNA==',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'From': "+16056006240",
        'To': to,
        'Body':
            "Thank your for your interest ! we will call you for payment transactions",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

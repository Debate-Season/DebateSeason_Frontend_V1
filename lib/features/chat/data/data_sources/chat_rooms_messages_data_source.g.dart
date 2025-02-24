// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_rooms_messages_data_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomsMessagesRes _$ChatRoomsMessagesResFromJson(
        Map<String, dynamic> json) =>
    ChatRoomsMessagesRes(
      messagesByDates: (json['messagesByDates'] as List<dynamic>)
          .map((e) => MessagesByDates.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$ChatRoomsMessagesResToJson(
        ChatRoomsMessagesRes instance) =>
    <String, dynamic>{
      'messagesByDates': instance.messagesByDates,
      'nextCursor': instance.nextCursor,
      'hasMore': instance.hasMore,
    };

MessagesByDates _$MessagesByDatesFromJson(Map<String, dynamic> json) =>
    MessagesByDates(
      date: json['date'] as String,
      chatMessageResponses: (json['chatMessageResponses'] as List<dynamic>)
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$MessagesByDatesToJson(MessagesByDates instance) =>
    <String, dynamic>{
      'date': instance.date,
      'chatMessageResponses': instance.chatMessageResponses,
      'hasMore': instance.hasMore,
      'totalCount': instance.totalCount,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ChatRoomsMessagesDataSource implements ChatRoomsMessagesDataSource {
  _ChatRoomsMessagesDataSource(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseRes<ChatRoomsMessagesRes>> getRawChatRoomsMessages({
    required int roomId,
    int? cursor,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cursor': cursor};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseRes<ChatRoomsMessagesRes>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/chat/rooms/${roomId}/messages',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseRes<ChatRoomsMessagesRes> _value;
    try {
      _value = BaseRes<ChatRoomsMessagesRes>.fromJson(
        _result.data!,
        (json) => ChatRoomsMessagesRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

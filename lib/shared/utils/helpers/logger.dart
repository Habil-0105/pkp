import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static void info(
      String message, {
        String? header,
        String? name,
        String? tag = 'INFO',
      }) {
    if (kDebugMode) {
      if (header != null) {
        log(
          List.filled(header.length + 6, '\x1B[36m=').join(),
          name: name ?? '💡',
        );
        log(
          '\x1B[36m|| $header ||',
          name: name ?? '💡',
        );
        log(
          List.filled(header.length + 6, '\x1B[36m=').join(),
          name: name ?? '💡',
        );
      }

      if (message.isNotEmpty && header == null) {
        log(
          '\x1B[36m${tag != null && tag.isNotEmpty ? '$tag | ' : ''}$message\x1B[0m',
          name: name ?? '💡',
        );
      }
    }
  }

  static void succes(
      Object message, {
        String? header,
        String? name,
        String? tag = 'SUCCESS',
      }) {
    if (kDebugMode) {
      if (header != null) {
        log(
          List.filled(header.length + 6, '\x1B[32m=').join(),
          name: name ?? '✅',
        );
        log(
          '\x1B[32m|| $header ||',
          name: name ?? '✅',
        );
        log(
          List.filled(header.length + 6, '\x1B[32m=').join(),
          name: name ?? '✅',
        );
      }

      if (message is String && message.isNotEmpty && header == null) {
        log(
          '\x1B[32m${tag != null && tag.isNotEmpty ? '$tag | ' : ''}$message\x1B[0m',
          name: name ?? '✅',
        );
      }

      if (message is Map && header == null) {
        log(
          '\x1B[32m${tag != null && tag.isNotEmpty ? '$tag | ' : ''}${LoggerUtil.jsonFormat(message)}\x1B[0m',
          name: name ?? '✅',
        );
      }
    }
  }

  static void error({
    String? header,
    String? name,
    String? tag = 'ERROR',
    StackTrace? stackTrace,
    Object? error,
  }) {
    if (kDebugMode) {
      if (header != null) {
        log(
          List.filled(header.length + 6, '\x1B[31m=').join(),
          name: name ?? '❌',
        );
        log(
          '\x1B[31m|| $header ||',
          name: name ?? '❌',
        );
        log(
          List.filled(header.length + 6, '\x1B[31m=').join(),
          name: name ?? '❌',
        );
      }

      if (error != null) {
        log(
          '',
          name: name ?? '❌',
          error: '${tag != null && tag.isNotEmpty ? '$tag | ' : ''}$error',
        );
      }
    }
  }
}

/// Pretty printer source: https://github.com/niezhiyang/flutter_logger/blob/master/lib/src/file_util.dart
class LoggerUtil {
  static String jsonFormat(Object data) {
    try {
      final json = jsonEncode(data);
      if (json.startsWith("{")) {
        Map<String, dynamic> decode = const JsonCodec().decode(json);
        return _convert(decode, 0);
      } else if (json.startsWith("[")) {
        List decode = const JsonCodec().decode(json);
        return _convert(decode, 0);
      } else {
        Logger.error(error: "Wrong format: $json");
        return "Wrong format: $json";
      }
    } catch (e) {
      Logger.error(error: "${e.toString().trim()}\njson: $json");
      return "${e.toString().trim()}\njson: $json";
    }
  }

  static String _convert(dynamic object, int deep, {bool isObject = false}) {
    var buffer = StringBuffer();
    var nextDeep = deep + 1;
    if (object is Map) {
      var list = object.keys.toList();
      if (!isObject) {
        buffer.write(getDeepSpace(deep));
      }
      buffer.write("{");
      if (list.isEmpty) {
        buffer.write("}");
      } else {
        buffer.write("\n");
        for (int i = 0; i < list.length; i++) {
          buffer.write("${getDeepSpace(nextDeep)}\"${list[i]}\":");
          buffer.write(_convert(object[list[i]], nextDeep, isObject: true));
          if (i < list.length - 1) {
            buffer.write(",");
            buffer.write("\n");
          }
        }
        buffer.write("\n");
        buffer.write("${getDeepSpace(deep)}}");
      }
    } else if (object is List) {
      if (!isObject) {
        buffer.write(getDeepSpace(deep));
      }
      buffer.write("[");
      if (object.isEmpty) {
        buffer.write("]");
      } else {
        buffer.write("\n");
        for (int i = 0; i < object.length; i++) {
          buffer.write(_convert(object[i], nextDeep));
          if (i < object.length - 1) {
            buffer.write(",");
            buffer.write("\n");
          }
        }
        buffer.write("\n");
        buffer.write("${getDeepSpace(deep)}]");
      }
    } else if (object is String) {
      buffer.write("\"$object\"");
    } else if (object is num || object is bool) {
      buffer.write(object);
    } else {
      buffer.write("null");
    }
    return buffer.toString();
  }

  static String getDeepSpace(int deep) {
    var tab = StringBuffer();
    for (int i = 0; i < deep; i++) {
      tab.write("　");
      // tab.write("\t");
    }
    return tab.toString();
  }
}
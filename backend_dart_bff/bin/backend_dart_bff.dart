import 'dart:io';

import 'package:backend_dart_bff/app/app_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

void main(List<String> arguments) async {

  const defaultHeadersList = [
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'no_authorization',
    'refreshed_token',
  ];

  final overrideHeaders = {
    ACCESS_CONTROL_ALLOW_HEADERS: defaultHeadersList.join(','),
  };

    final modularHandler = Modular(
      module: AppModule(), // Initial Module
      middlewares: [
        logRequests(), // Middleware Pipeline
        corsHeaders(headers: overrideHeaders),
        jsonEncoder(),
      ],
    );

    final server = await io.serve(modularHandler, '0.0.0.0', 3001);
    print('Server started: ${server.address.address}:${server.port}');
}

Middleware jsonEncoder() {
  return (innerHanddler) {
    return (request) async {
      var response = await innerHanddler(request);

      if (!response.headers.containsKey(HttpHeaders.contentTypeHeader)) {
        response = response.change(headers: {
          ...response.headers,
          HttpHeaders.contentTypeHeader: 'application/json',
        });
      }

      return response;
    };
  };
}
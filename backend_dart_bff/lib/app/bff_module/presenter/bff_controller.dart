import 'package:backend_dart_bff/app/bff_module/domain/entities/bff_arguments_entity.dart';
import 'package:backend_dart_bff/app/bff_module/domain/usecases/send_text_usecase.dart';
import 'package:backend_dart_bff/app/bff_module/presenter/model/bff_model.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import '../domain/usecases/row_page_usecase.dart';
import '../domain/usecases/select_page_usecase.dart';

class BffController {
  final ISelectPageUsecase _selectPageUsecase;
  final IRowPageUsecase _iRowPageUsecase;
  final ISendTextUsecase _sendTextUsecase;

  BffController(this._selectPageUsecase, this._iRowPageUsecase, this._sendTextUsecase);
  Future<Response> returnSelectPage(ModularArguments args, Request request) async {
    final result = await _selectPageUsecase(BffArgumentsEntity());
    return result.fold(
      (l) => Response.notFound('{}'),
      (r) => Response.ok(BffModel.from(r).toJson()),
    );
  }

  Future<Response> returnRowPage(ModularArguments args, Request request) async {
    final result = await _iRowPageUsecase(BffArgumentsEntity());
    return result.fold(
      (l) => Response.notFound('{}'),
      (r) => Response.ok(BffModel.from(r).toJson()),
    );
  }

  Future<Response> sendText(ModularArguments args, Request request) async {
    final result = await _sendTextUsecase(BffArgumentsEntity(textTitle: args.data['text'] ?? ''));
    return result.fold(
      (l) => Response.notFound('{}'),
      (r) => Response.ok(BffModel.from(r).toJson()),
    );
  }
}

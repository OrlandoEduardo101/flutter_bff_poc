import 'package:backend_dart_bff/app/bff_module/domain/usecases/row_page_usecase.dart';
import 'package:backend_dart_bff/app/bff_module/domain/usecases/select_page_usecase.dart';
import 'package:backend_dart_bff/app/bff_module/domain/usecases/send_text_usecase.dart';
import 'package:backend_dart_bff/app/bff_module/presenter/bff_controller.dart';
import 'package:backend_dart_bff/app/bff_module/presenter/bff_resource.dart';
import 'package:shelf_modular/shelf_modular.dart';

class BffModule extends Module {
  @override
  List<Bind> get binds => [
        //presenter
        Bind.scoped((i) => BffController(i(), i(), i())),

        //domain
        Bind.scoped((i) => SelectPageUsecase()),
        Bind.scoped((i) => RowPageUsecase()),
        Bind.scoped((i) => SendTextUsecase()),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.resource(BffResource()),
      ];
}

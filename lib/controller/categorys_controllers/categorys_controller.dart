import 'package:app_mercado/model/categoria.dart';
import 'package:app_mercado/service/categorys_services/categorys_service.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:mobx/mobx.dart';
part 'categorys_controller.g.dart';

class CategorysController = _CategorysControllerBase with _$CategorysController;

abstract class _CategorysControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  List<Categoria> categorys = ObservableList<Categoria>();

  @observable
  String errorMsg = "";

  @observable
  bool progress = false;

  @observable
  bool categorysLoaded = false;
  ////// FIM - Observables //////

  ////// INICIO - Actions //////

  @action
  Future<dynamic> getCategorys() async {
    progress = true;
    ApiResponse response = await CategorysService.getCategorys();
    progress = false;

    if (response.result != null) {
      categorys = response.result;
      categorysLoaded = true;
      errorMsg = "";
    } else {
      errorMsg = response.msg!;
    }
  }

  ////// FIM - Actions //////
}

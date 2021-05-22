import 'package:app_mercado/model/compra.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/service/buys_services/buys_services.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:mobx/mobx.dart';
part 'client_buys_controller.g.dart';

class ClientBuysController = _ClientBuysControllerBase
    with _$ClientBuysController;

abstract class _ClientBuysControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  List<Compra> clientBuys = ObservableList<Compra>();

  @observable
  List<Compra> clientPendingBuys = ObservableList<Compra>();

  @observable
  List<Compra> clientConfirmedBuys = ObservableList<Compra>();

  @observable
  List<Compra> clientRejectedBuys = ObservableList<Compra>();

  @observable
  List<Produto> separatedProducts = ObservableList<Produto>();

  @observable
  String errorMsg = "";

  @observable
  bool loadBuys = true;

  @observable
  bool progress = false;
  ////// FIM - Observables //////

  ////// INICIO - Actions //////

  @action
  Future<dynamic> getClientBuys() async {
    progress = true;
    ApiResponse response = await BuysServices.getBuysByClient();
    if (response.result != null) {
      clientBuys = response.result;
      separeBuys();
      progress = false;
      loadBuys = false;
      errorMsg = "";
    } else {
      errorMsg = response.msg!;
      progress = false;
    }
  }

  @action
  setLoadBuys() {
    loadBuys = true;
  }

  @action
  separeBuys() {
    clientPendingBuys =
        clientBuys.where((compra) => compra.status == "Pendente").toList();
    clientConfirmedBuys =
        clientBuys.where((compra) => compra.status == "Confirmada").toList();
    clientRejectedBuys =
        clientBuys.where((compra) => compra.status == "Rejeitada").toList();
  }

  @action
  setSeparetedProducts(List<Produto> products) {
    /// Variavel que vai ser usada pra comparar os ids dos produtos da lista
    /// de produtos da compra.
    final existingProducts = Set<int>();

    /// Lista sem produtos duplicadas que vai ser exibida no card de
    /// produtos da compra!
    separatedProducts =
        products.where((produto) => existingProducts.add(produto.id!)).toList();
  }

  /// Método que checa quantos produtos de um mesmo tipo estão na lista
  /// de produtos da compra.
  @action
  int checkQuantityOfProductInBuyList(Produto produto, List<Produto> products) {
    int quantityProductsRepeteads = products
        .map((element) => element.id == produto.id ? 1 : 0)
        .reduce((value, element) => value + element);

    return quantityProductsRepeteads;
  }

  ////// FIM - Observables //////
}

import 'package:mobx/mobx.dart';
import 'package:shopping_food/app/models/produto_model.dart';

part 'cart_store.g.dart';

class CartStore = CartStoreBase with _$CartStore;

abstract class CartStoreBase with Store {
  @observable
  List<ProdutoModel> produtosCarrinho = [];

  @action
  void setCarrinho(value) => produtosCarrinho = value;

  @action
  void addCarrinho(ProdutoModel produtoModel, List<ProdutoModel> list) {
    list.add(produtoModel);
    setCarrinho(list);
  }

  @action
  void removeCarrinho(ProdutoModel produtoModel, List<ProdutoModel> list) {
    list.remove(produtoModel);
    setCarrinho(list);
  }
}

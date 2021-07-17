import 'package:shopping_food/app/modules/carrinho/carrinho_Page.dart';
import 'package:shopping_food/app/modules/carrinho/carrinho_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping_food/app/stores/cart_store.dart';

class CarrinhoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CarrinhoStore()),
    Bind.lazySingleton((i) => CartStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CarrinhoPage()),
  ];
}

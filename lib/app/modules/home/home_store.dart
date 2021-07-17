import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_food/app/models/produto_model.dart';
import 'package:shopping_food/app/repositories/produto_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  @observable
  int page = 0;

  @action
  void setPage(value) => page = value;

  @observable
  List<String> categorias = [
    "Fruits",
    "Vegetables",
    "Vegan",
    "Bakery",
    "Dairy",
    "Meats"
  ];

  @observable
  List<Icon> iconesCategorias = [
    Icon(
      LineIcons.fruitApple,
      color: Colors.orange,
      size: 25,
    ),
    Icon(
      LineIcons.seedling,
      color: Colors.orange,
      size: 25,
    ),
    Icon(
      LineIcons.carrot,
      color: Colors.orange,
      size: 25,
    ),
    Icon(
      LineIcons.breadSlice,
      color: Colors.orange,
      size: 25,
    ),
    Icon(
      LineIcons.cheese,
      color: Colors.orange,
      size: 25,
    ),
    Icon(
      LineIcons.drumstickWithBiteTakenOut,
      color: Colors.orange,
      size: 25,
    ),
  ];

  @observable
  List<ProdutoModel> produtos = [];

  @observable
  List<ProdutoModel> vegetais = [];

  @observable
  List<ProdutoModel> frutas = [];

  @observable
  List<ProdutoModel> laticinios = [];

  @observable
  List<ProdutoModel> padaria = [];

  @observable
  List<ProdutoModel> vegano = [];

  @observable
  List<ProdutoModel> carnes = [];

  @action
  void setList(value) => produtos = value;

  @action
  Future<void> getList() async {
    ProdutoRepository repository = ProdutoRepository();
    List<ProdutoModel> listTemp = await repository.getProdutos();
    produtos = listTemp;

    for (var value in produtos) {
      if (value.type == 'fruit') {
        frutas.add(value);
      } else if (value.type == 'vegetable') {
        vegetais.add(value);
      } else if (value.type == 'vegan') {
        vegano.add(value);
      } else if (value.type == 'dairy') {
        laticinios.add(value);
      } else if (value.type == 'bakery') {
        padaria.add(value);
      } else {
        carnes.add(value);
      }
    }
    setList(listTemp);
  }

  @observable
  int counter = 0;

  @action
  Future<void> increment() async {
    counter = counter + 1;
  }
}

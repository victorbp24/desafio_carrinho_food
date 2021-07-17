// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$pageAtom = Atom(name: 'HomeStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$categoriasAtom = Atom(name: 'HomeStoreBase.categorias');

  @override
  List<String> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<String> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  final _$iconesCategoriasAtom = Atom(name: 'HomeStoreBase.iconesCategorias');

  @override
  List<Icon> get iconesCategorias {
    _$iconesCategoriasAtom.reportRead();
    return super.iconesCategorias;
  }

  @override
  set iconesCategorias(List<Icon> value) {
    _$iconesCategoriasAtom.reportWrite(value, super.iconesCategorias, () {
      super.iconesCategorias = value;
    });
  }

  final _$produtosAtom = Atom(name: 'HomeStoreBase.produtos');

  @override
  List<ProdutoModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<ProdutoModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$vegetaisAtom = Atom(name: 'HomeStoreBase.vegetais');

  @override
  List<ProdutoModel> get vegetais {
    _$vegetaisAtom.reportRead();
    return super.vegetais;
  }

  @override
  set vegetais(List<ProdutoModel> value) {
    _$vegetaisAtom.reportWrite(value, super.vegetais, () {
      super.vegetais = value;
    });
  }

  final _$frutasAtom = Atom(name: 'HomeStoreBase.frutas');

  @override
  List<ProdutoModel> get frutas {
    _$frutasAtom.reportRead();
    return super.frutas;
  }

  @override
  set frutas(List<ProdutoModel> value) {
    _$frutasAtom.reportWrite(value, super.frutas, () {
      super.frutas = value;
    });
  }

  final _$laticiniosAtom = Atom(name: 'HomeStoreBase.laticinios');

  @override
  List<ProdutoModel> get laticinios {
    _$laticiniosAtom.reportRead();
    return super.laticinios;
  }

  @override
  set laticinios(List<ProdutoModel> value) {
    _$laticiniosAtom.reportWrite(value, super.laticinios, () {
      super.laticinios = value;
    });
  }

  final _$padariaAtom = Atom(name: 'HomeStoreBase.padaria');

  @override
  List<ProdutoModel> get padaria {
    _$padariaAtom.reportRead();
    return super.padaria;
  }

  @override
  set padaria(List<ProdutoModel> value) {
    _$padariaAtom.reportWrite(value, super.padaria, () {
      super.padaria = value;
    });
  }

  final _$veganoAtom = Atom(name: 'HomeStoreBase.vegano');

  @override
  List<ProdutoModel> get vegano {
    _$veganoAtom.reportRead();
    return super.vegano;
  }

  @override
  set vegano(List<ProdutoModel> value) {
    _$veganoAtom.reportWrite(value, super.vegano, () {
      super.vegano = value;
    });
  }

  final _$carnesAtom = Atom(name: 'HomeStoreBase.carnes');

  @override
  List<ProdutoModel> get carnes {
    _$carnesAtom.reportRead();
    return super.carnes;
  }

  @override
  set carnes(List<ProdutoModel> value) {
    _$carnesAtom.reportWrite(value, super.carnes, () {
      super.carnes = value;
    });
  }

  final _$counterAtom = Atom(name: 'HomeStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('HomeStoreBase.getList');

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$incrementAsyncAction = AsyncAction('HomeStoreBase.increment');

  @override
  Future<void> increment() {
    return _$incrementAsyncAction.run(() => super.increment());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setPage(dynamic value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setList(dynamic value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setList');
    try {
      return super.setList(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
categorias: ${categorias},
iconesCategorias: ${iconesCategorias},
produtos: ${produtos},
vegetais: ${vegetais},
frutas: ${frutas},
laticinios: ${laticinios},
padaria: ${padaria},
vegano: ${vegano},
carnes: ${carnes},
counter: ${counter}
    ''';
  }
}

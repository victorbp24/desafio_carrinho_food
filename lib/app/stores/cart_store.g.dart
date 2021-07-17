// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on CartStoreBase, Store {
  final _$produtosCarrinhoAtom = Atom(name: 'CartStoreBase.produtosCarrinho');

  @override
  List<ProdutoModel> get produtosCarrinho {
    _$produtosCarrinhoAtom.reportRead();
    return super.produtosCarrinho;
  }

  @override
  set produtosCarrinho(List<ProdutoModel> value) {
    _$produtosCarrinhoAtom.reportWrite(value, super.produtosCarrinho, () {
      super.produtosCarrinho = value;
    });
  }

  final _$CartStoreBaseActionController =
      ActionController(name: 'CartStoreBase');

  @override
  void setCarrinho(dynamic value) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.setCarrinho');
    try {
      return super.setCarrinho(value);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCarrinho(ProdutoModel produtoModel, List<ProdutoModel> list) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.addCarrinho');
    try {
      return super.addCarrinho(produtoModel, list);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCarrinho(ProdutoModel produtoModel, List<ProdutoModel> list) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.removeCarrinho');
    try {
      return super.removeCarrinho(produtoModel, list);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produtosCarrinho: ${produtosCarrinho}
    ''';
  }
}

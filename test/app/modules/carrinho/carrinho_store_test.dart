import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_food/app/modules/carrinho/carrinho_store.dart';
 
void main() {
  late CarrinhoStore store;

  setUpAll(() {
    store = CarrinhoStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
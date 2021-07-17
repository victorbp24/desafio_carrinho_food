import 'dart:convert';

import 'package:shopping_food/app/interfaces/produto_repository_interface.dart';
import 'package:shopping_food/app/models/produto_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_food/app/shared/const/consts.dart';

class ProdutoRepository implements IProdutoRepository {
  @override
  Future<List<ProdutoModel>> getProdutos() async {
    List<ProdutoModel> list = [];
    var url = Uri.parse(AppConsts.URL_BASE);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body) as List;

      for (var json in body) {
        final ProdutoModel model = ProdutoModel.fromJson(json);
        list.add(model);
      }
    }
    return list;
  }
}

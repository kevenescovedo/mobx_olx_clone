import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class Category {
  String? id;
  String? description;
  Category({this.id, this.description});
  Category.fromParse(final ParseObject object) {
   this.id = object.objectId;
   this.description = object.get(keyCategoryDescription);
  }

  @override
  String toString() {
    return 'Category{id: $id, description: $description}';
  }
}
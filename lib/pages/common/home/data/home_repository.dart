


import 'package:property_managment/base/base_repositroy.dart';

import 'home_api_provider.dart';

abstract class IHomeRepository {


}

class HomeRepository extends BaseRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

}

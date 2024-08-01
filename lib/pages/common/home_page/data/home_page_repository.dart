


import 'package:property_managment/base/base_repositroy.dart';

import 'home_page_api_provider.dart';

abstract class IHomePageRepository {


}

class HomePageRepository extends BaseRepository implements IHomePageRepository {
  HomePageRepository({required this.provider});
  final IHomePageProvider provider;

}

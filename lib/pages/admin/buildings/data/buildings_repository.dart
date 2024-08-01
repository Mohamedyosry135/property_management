


import 'package:get/get.dart';
import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';

import 'buildings_api_provider.dart';

abstract class IBuildingsRepository {
  Future<List<RealStatesModel>> getRealStates() ;


}

class BuildingsRepository extends BaseRepository implements IBuildingsRepository {
  BuildingsRepository({required this.provider});
  final IBuildingsProvider provider;

  @override
  Future<List<RealStatesModel>> getRealStates() async{
    final apiResponse = await provider.getRealStates() ;
    printInfo(info: apiResponse.toString());
    if(apiResponse != null){
      return apiResponse;
    }else {
      throw(getErrorMessage("Error")) ;
    }
  }

}

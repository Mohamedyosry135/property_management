


import 'package:property_managment/base/base_repositroy.dart';
import 'package:property_managment/pages/common/support/models/support_response.dart';

import 'support_api_provider.dart';

abstract class ISupportRepository {

  Future<SupportResponseMessage> addMessageSupport(String message);

}

class SupportRepository extends BaseRepository implements ISupportRepository {
  SupportRepository({required this.provider});
  final ISupportProvider provider;

  @override
  Future<SupportResponseMessage> addMessageSupport(String message)async {
    final apiResponse = await provider.addMessageSupport(message);
    if(apiResponse.isOk&& apiResponse.body != null){
      return apiResponse.body!;
    }else {
      throw(getErrorMessage("error")) ;
    }
  }

}

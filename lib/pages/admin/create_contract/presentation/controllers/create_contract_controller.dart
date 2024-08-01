import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/create_contract/data/create_contract_repository.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_request.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class CreateContractController extends SuperController<dynamic> {
  CreateContractController({required this.createContractRepository});

  final ICreateContractRepository createContractRepository;

  // ContractPaymentRequest contractPaymentRequest = ContractPaymentRequest();
  RxList<ContractPaymentRequest> contractPaymentRequestList =<ContractPaymentRequest>[].obs;



  ContractRequest contractRequest = ContractRequest();
  FinanicalRequest finanicalRequest = FinanicalRequest();
  TextEditingController rentController = TextEditingController();

  TextEditingController taxAmountController = TextEditingController();
  TextEditingController adminstrativeFee = TextEditingController();
  TextEditingController tmmPrecentage = TextEditingController();

  double? taxPercentage;
  double? additionalFee;
  RxString typeFinancial = "".obs;
  List<String> typeFinancialList = [
    CommonLang.select.tr(),
    // CommonLang.monthly.tr(),
    // CommonLang.quarterly.tr(),
    // CommonLang.midterm.tr(),
    // CommonLang.annual.tr()
  ];
  // Map<String,String> rentalCycle = {
  //   CommonLang.monthly.tr():"monthly",
  //  CommonLang.quarterly.tr(): "quarterly",
  //   CommonLang.midterm.tr():"midterm",
  //   CommonLang.annual.tr():"annual",
  // };


  ConstantsLists constantsLists = ConstantsLists();
  RxInt numberOfYears =1.obs;
  List<int> years = [1,2,3,4,5];

  Rx<Users> selectedLessor = Users().obs;
  Rx<Users> selectedOwner = Users().obs;
  Rx<Users> selectedRepresentativeLessor = Users().obs;
  Rx<Users> selectedRepresentativeOwner = Users().obs;
  Rx<RealStatesModel> selectedRealStatesModel = RealStatesModel().obs;
  List<RealStatesModel> realStatesLit = [];
  List<String> unitTypes = ["apartment","villa","mall","complex","building","workers_housing","tower","duplex","flat","office","chalet","warehouse","station","land","other"];
RxString unitTypesSelected= "".obs;
  getRealStates() async {
    change(false, status: RxStatus.loading());
    await createContractRepository.getRealStates().then((value) {
      realStatesLit = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      print("eror ${error.toString()}");
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("خطأ", "حدث خطأ ما");
    });
  }

  getConstantsList()async{
    change(false, status: RxStatus.loading());
    await createContractRepository.getConstantsLists().then((value) {
      constantsLists = value;
      typeFinancialList.addAll(value.data?.paymentCycles ??[]);
      taxPercentage = value.data?.taxPercentage;
      additionalFee = value.data?.additionalFee;
      // adminstrativeFee.text = (value.data?.additionalFee).toString();
      finanicalRequest
          .managementTax =
          value.data?.additionalFee;
      print("constantsLists.data?.cities?.length ${constantsLists.data?.cities?.length}");
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      print("eror ${error.toString()}");
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("خطأ", "حدث خطأ ما");
    });
  }
  @override
  void onInit() async {
    if (AuthService.to.userInfo == null) {
       AuthService.to.logout().then((value){
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });
    }
    getUsersOwner();
    getUsersRenter();
    getUsersOwnerRepresenter();
    getUsersRenterRepresenter();

    getRealStates();
    getConstantsList();
    super.onInit();
  }

  List<Users> usersOwner = [];
  List<Users> usersRenter = [];
  List<Users> usersOwnerRepresenter = [];
  List<Users> usersRenterRepresenter = [];

  getUsersOwner() {
    change(false, status: RxStatus.loading());
    createContractRepository.getRealstateUsers("owner").then((value) {
      usersOwner = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }
  getUsersRenter () {
    change(false, status: RxStatus.loading());
    createContractRepository.getRealstateUsers("renter").then((value) {
      usersRenter = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }
  getUsersOwnerRepresenter () {
    change(false, status: RxStatus.loading());
    createContractRepository.getRealstateUsers("owner_representer").then((value) {
      usersOwnerRepresenter = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }
  getUsersRenterRepresenter () {
    change(false, status: RxStatus.loading());
    createContractRepository.getRealstateUsers("renter_representer").then((value) {
      usersRenterRepresenter = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  onCreateContract() {
    finanicalRequest.type = "rent";
    PaymentsRequest paymentsRequest = PaymentsRequest();
    paymentsRequest.bulk = true;
    paymentsRequest.contracts = contractPaymentRequestList.value;
    print(paymentsRequest.toJson());
    change(false, status: RxStatus.loading());
    createContractRepository
        .createFinancial(finanicalRequest)
        .then((value) async {
      print("onCreateContract Model ${value!.toJson()}");

      print("WHY NULL ${value?.result?.data?.id!}");
      contractRequest.financialId = value?.result?.data?.id!;
      contractRequest.realStateId = selectedRealStatesModel.value.id;
      contractRequest.ownerId = selectedOwner.value.id;
      contractRequest.renterId = selectedLessor.value.id;
      // contractRequest.type = unitTypesSelected.value;

      contractRequest.ownerRepresenterId = selectedRepresentativeOwner.value.id;
      contractRequest.renterRepresenterId = selectedRepresentativeLessor.value.id;
      await createContractRepository
          .createContract(contractRequest)
          .then((value2) async {
        print("WHY 2 NULL ${value2?.result?.data?.id!}");
        contractPaymentRequestList.value.forEach((element) {
          element.contractId = value2?.result?.data?.id;
        });


        await createContractRepository
            .creatPaymentContract(paymentsRequest)
            .then((value) async {
          List<ContractPaymentRequest> temp =[];
              for(ContractPaymentRequest contractPaymentRequest in paymentsRequest.contracts!){
                ContractPaymentRequest tempPament = ContractPaymentRequest(contractId: contractPaymentRequest.contractId,isPaid: true,isDocument: true,price: contractPaymentRequest.price,taxAmount: contractPaymentRequest.taxAmount,
                paymentDeadline: contractPaymentRequest.paymentDeadline, name: contractPaymentRequest.name );
                    if(contractPaymentRequest.isPaid!){
                      temp.add(tempPament);
                    }
              }
              if(temp.isNotEmpty){
                PaymentsRequest documentRequest = PaymentsRequest(bulk: true, contracts: temp);

                await createContractRepository
                    .creatPaymentContract(documentRequest).then((value) {
                  change(true, status: RxStatus.success());
                  Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
                  Get.snackbar("", "تم انشاء العقد بنجاح");
                }).onError((error, stackTrace){
                  Get.snackbar("خطا", "حصل خطأ ما");
                  change(true, status: RxStatus.success());
                });
              }else{
          change(true, status: RxStatus.success());
          Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
          Get.snackbar("", "تم انشاء العقد بنجاح");
          }


        }).onError((error, stackTrace) {
          Get.snackbar("خطا", "حصل خطأ ما");
          change(true, status: RxStatus.success());
        });
      }).onError((error, stackTrace) {
        Get.snackbar("خطا", "حصل خطأ ما");
        change(true, status: RxStatus.success());
      });
    }).onError((error, stackTrace) {
      Get.snackbar("خطا", "حصل خطأ ما");
      change(true, status: RxStatus.success());
    });
  }

  RxBool isPaid = false.obs;
  TextEditingController startDate = TextEditingController();
  DateTime? startDateTime;
  TextEditingController endDate = TextEditingController();
  // TextEditingController paymentDeadline = TextEditingController();
  RxBool isEnabled = true.obs;
  RxBool isEnabled2 = true.obs;

  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(ColorCode.blue), // Set the primary color to blue
            colorScheme: ColorScheme.light(primary: Color(ColorCode.blue)), // Set the color scheme to use blue
          ),
          child: child!,
        );
      },
    );
    return pickedDate;
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/pages/admin/bond_preview/data/bond_preview_repository.dart';
import 'package:property_managment/pages/admin/bond_preview/models/contract_payments_bond_model.dart';
import 'package:property_managment/pages/admin/bond_preview/models/edit_bond_field.dart';
import 'package:property_managment/pages/admin/bond_preview/models/financial_data_model.dart';
import 'package:property_managment/pages/admin/buildings/model/real_states_model.dart';
import 'package:property_managment/pages/admin/control_board/models/contract_model.dart';
import 'package:property_managment/pages/admin/create_contract/models/constants_lists.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_payment_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/contract_request.dart';
import 'package:property_managment/pages/admin/create_contract/models/financial_request.dart';
import 'package:property_managment/pages/admin/owners_tenants/models/users.dart';
import 'package:property_managment/routes/common_routing/app_pages.dart';
import 'package:property_managment/services/auth_service.dart';

class BondPreviewController extends SuperController<dynamic> {
  BondPreviewController({required this.bondPreviewRepository});

  final IBondPreviewRepository bondPreviewRepository;
  final GlobalKey<FormState> formKey2 = GlobalKey();

  int? contractId;
  ContractPaymentsBondModel? contractPaymentsBondModel;
  ContractPaymentsBondModel? contractsBonds;

  ContractPaymentRequest contractPaymentRequest = ContractPaymentRequest();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController taxEditingController = TextEditingController();

  List<EditBondController> editBondList = [];
  List<EditBondController> editBondsPrivewList = [];

  ContractPayment? requestToUpdate;
  ConstantsLists constantsLists = ConstantsLists();

  ContractModel contractDetails = ContractModel();
  FinancialDataModel financialDetails = FinancialDataModel();

  List<Users> users = [];
  List<RealStatesModel> realStatesLit = [];
  double? tax;

  TextEditingController rentController = TextEditingController();
  TextEditingController taxAmountController = TextEditingController();
  TextEditingController electricityTax = TextEditingController();
  TextEditingController waterTax = TextEditingController();
  TextEditingController cleaningTax = TextEditingController();
  TextEditingController adminstrativeFee = TextEditingController();
  TextEditingController tmmPrecentage = TextEditingController();

  TextEditingController contractNumber = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  DateTime? startDateTime;

  Rx<Users> selectedLessor = Users().obs;
  Rx<Users> selectedOwner = Users().obs;
  Rx<Users> selectedRepresentativeLessor = Users().obs;
  Rx<Users> selectedRepresentativeOwner = Users().obs;
  Rx<RealStatesModel> selectedRealStatesModel = RealStatesModel().obs;

  List<Users> usersOwner = [];
  List<Users> usersRenter = [];
  List<Users> usersOwnerRepresenter = [];
  List<Users> usersRenterRepresenter = [];

  ContractRequest contractEdit = ContractRequest();
  FinanicalRequest finanicalEdit = FinanicalRequest();

  @override
  void onInit() async {
    change(false, status: RxStatus.loading());
    if (AuthService.to.userInfo == null) {
      AuthService.to.logout().then((value) {
        Get.rootDelegate.offNamed(Routes.LOGIN);
        Get.rootDelegate.backUntil(Routes.LOGIN);
      });
    }
    var args = Get.rootDelegate.parameters["id"].toString();
    contractId = int.tryParse(args.toString());
    await getPaymentContacts(contractId!);
    await getConstantsList();
    getPaymentBonds(contractId!);


    await   getContractDetails(contractId!);
    change(true, status: RxStatus.success());


    super.onInit();
  }
  RxBool loadingData = true.obs;

  getConstantsList() async {
    change(false, status: RxStatus.loading());
    await bondPreviewRepository.getConstantsLists().then((value) {
      constantsLists = value;
      tax = value.data?.taxPercentage;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      print("eror ${error.toString()}");
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("خطأ", "حدث خطأ ما");
    });
  }

  getPaymentContacts(int id) {
    change(false, status: RxStatus.loading());
    bondPreviewRepository.getPaymentContacts(id).then((value) {
      contractPaymentsBondModel = value;
      for (ContractPayment contractPayment in value.data ?? []) {
        editBondList.add(EditBondController(
            id: contractPayment.id,
            nameEditingController:
                TextEditingController(text: contractPayment.name),
            isPaid: contractPayment.isPaid?.obs,
            paymentDeadlineEditingController:
                TextEditingController(text: contractPayment.paymentDeadline),
            priceEditingController:
                TextEditingController(text: contractPayment.price.toString()),
            taxAmountEditingController: TextEditingController(
                text: contractPayment.taxAmount.toString()),
            totalPriceEditingController: TextEditingController(
                text: contractPayment.totalPrice.toString())));
      }
      change(true, status: RxStatus.success());

      // change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
      Get.snackbar("خطأ", "حصل خطأ ما");
      change(true, status: RxStatus.success());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
    });
  }

  getPaymentBonds(int id) {
    change(false, status: RxStatus.loading());
    bondPreviewRepository.getBondsDetails(id).then((value) {
      contractsBonds = value;
      for (ContractPayment contractPayment in value.data ?? []) {
        editBondsPrivewList.add(EditBondController(
            id: contractPayment.id,
            nameEditingController:
            TextEditingController(text: contractPayment.name),
            isPaid: contractPayment.isPaid?.obs,
            paymentDeadlineEditingController:
            TextEditingController(text: contractPayment.paymentDeadline),
            priceEditingController:
            TextEditingController(text: contractPayment.price.toString()),
            taxAmountEditingController: TextEditingController(
                text: contractPayment.taxAmount.toString()),
            totalPriceEditingController: TextEditingController(
                text: contractPayment.totalPrice.toString())));

      }
      change(true, status: RxStatus.success());

      // change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
      Get.snackbar("خطأ", "حصل خطأ ما");
      change(true, status: RxStatus.success());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
    });
  }

  createPaymentContract() {
    change(false, status: RxStatus.loading());
    contractPaymentRequest.contractId = contractId;
    contractPaymentRequest.isPaid = isPaid.value;
    contractPaymentRequest.isDocument =true;

    PaymentsRequest paymentsRequest = PaymentsRequest();
    paymentsRequest.bulk = true;
    paymentsRequest.contracts = [contractPaymentRequest];
    bondPreviewRepository.creatPaymentContract(paymentsRequest).then((value) {
      Get.snackbar("", CommonLang.addedSuccessfully.tr());
      editBondList.clear();
      editBondList = [];
      editBondsPrivewList.clear();
      editBondsPrivewList=[];
      getPaymentContacts(contractId!);
      getPaymentBonds(contractId!);
    }).onError((error, stackTrace) {
      print("creatPaymentContract ${error}");
      Get.snackbar("خطا", "حصل خطأ ما");
      change(true, status: RxStatus.success());
    });
  }

  updatePaymentContract(int id, bool IS_DOCUMENT) {
    print("djklsfklds ${requestToUpdate?.isPaid}");
    print("alaaa ${IS_DOCUMENT && (requestToUpdate?.isPaid ??false)}");

    change(false, status: RxStatus.loading());

    bondPreviewRepository
        .updatePaymentContract(id, requestToUpdate!)
        .then((value) {
      if( IS_DOCUMENT && (requestToUpdate?.isPaid ??false)  ){
        ContractPaymentRequest createBond = ContractPaymentRequest(isDocument: true, isPaid: requestToUpdate?.isPaid,
          paymentDeadline:requestToUpdate?.paymentDeadline,name:requestToUpdate?.name,
          taxAmount: requestToUpdate?.taxAmount,price: requestToUpdate?.price,contractId: contractId,  );
        PaymentsRequest request = PaymentsRequest(bulk: true, contracts:[createBond]);
        print("kldfhjsgdhs ${request.toJson()}");
        bondPreviewRepository.creatPaymentContract(request).then((value) {
          // Get.snackbar("", CommonLang.addedSuccessfully.tr());
          editBondList.clear();
          editBondList = [];
          editBondsPrivewList.clear();
          editBondsPrivewList=[];
          getPaymentContacts(contractId!);
          getPaymentBonds(contractId!);
        }).onError((error, stackTrace) {
          print("creatPaymentContract ${error}");
          Get.snackbar("خطا", "حصل خطأ ما");
          change(true, status: RxStatus.success());
        });
      }else{
        editBondList.clear();
        editBondList = [];
        editBondsPrivewList.clear();
        editBondsPrivewList=[];

        getPaymentContacts(contractId!);
        getPaymentBonds(contractId!);
      }

      Get.snackbar("", CommonLang.update.tr());

    }).onError((error, stackTrace) {
      print("creatPaymentContract ${error}");
      Get.snackbar("خطا", "حصل خطأ ما");
      change(true, status: RxStatus.success());
    });
  }

  deleteRealState(int id) {
    change(false, status: RxStatus.loading());
    var apiResp = bondPreviewRepository.deletePaymentContract(id).then((value) {
      Get.snackbar("", CommonLang.deletedSuccessfully.tr());
      editBondList.clear();
      editBondList = [];
      editBondsPrivewList.clear();
      editBondsPrivewList=[];
      change(true, status: RxStatus.success());
      getPaymentBonds(contractId!);
      getPaymentContacts(contractId!);
    }, onError: (err) {
      Get.snackbar("", err.toString());
      change(true, status: RxStatus.success());
    });
  }

  getFinancialDetails(int id) async {
    change(false, status: RxStatus.loading());
    await bondPreviewRepository.getContractFinancialDetails(id).then((value) {
      financialDetails = value;
      rentController.text = value.price.toString();
      taxAmountController.text = value.taxAmount.toString();
      electricityTax.text = value.electricityTax.toString();
      waterTax.text = value.waterTax.toString();
      cleaningTax.text = value.cleaningTax.toString();
      adminstrativeFee.text = value.managementTax.toString();
      tmmPrecentage.text = value.tammemPercentage.toString();
    });
  }

  getContractDetails(int id) async {
    loadingData.value =true;
    await bondPreviewRepository.getContractDetails(id).then((value)async {
      contractDetails = value;
      contractNumber.text = value.contractNumber ?? "";
      startDate.text = value.startDate ?? "";
      endDate.text = value.endDate ?? "";
      await getFinancialDetails(value.financialId ??0);
      await getRealStates(value.realStateId ?? 0);
      await getUsersOwner(value.ownerId ?? 0);
      await getUsersOwnerRepresenter(value.ownerRepresenterId ?? 0);
      await getUsersRenterRepresenter(value.renterRepresenterId ?? 0);
      Future.delayed(Duration(seconds: 1)).then((value2)async{
        await getUsersRenter(value.renterId ?? 0);
        loadingData.value =false;

      });


    });
  }

  getRealStates(int id) async {
    bondPreviewRepository.getRealStates().then((value) {
      realStatesLit = value;
      selectedRealStatesModel.value =
          realStatesLit.firstWhereOrNull((element) => element.id == id) ??
              RealStatesModel();

      // change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  getUsersOwner(int id) {
    bondPreviewRepository.getUsers("owner").then((value) {
      usersOwner = value;
      selectedOwner.value =
          usersOwner.firstWhereOrNull((element) => element.id == id) ?? Users();
    }).onError((error, stackTrace) {
      // change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  Future<void> getUsersRenter(int id)async{
    await bondPreviewRepository.getUsers("renter").then((value) {
      usersRenter = value;
      selectedLessor.value = usersRenter.firstWhereOrNull((element) => element.id == id) ?? Users();
    }).onError((error, stackTrace) {
      print("errr ${error.toString()}");
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  getUsersOwnerRepresenter(int id) {
    bondPreviewRepository.getUsers("owner_representer").then((value) {
      usersOwnerRepresenter = value;
      selectedRepresentativeOwner.value = usersOwnerRepresenter
              .firstWhereOrNull((element) => element.id == id) ??
          Users();

      // change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  getUsersRenterRepresenter(int id) {
    bondPreviewRepository.getUsers("renter_representer").then((value) {
      usersRenterRepresenter = value;
      selectedLessor.value = usersRenterRepresenter
              .firstWhereOrNull((element) => element.id == id) ??
          Users();

      // change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  deleteContract(int id) {
    change(false, status: RxStatus.loading());
    bondPreviewRepository.deleteContract(id).then((value) {
      Get.snackbar("", CommonLang.deletedSuccessfully.tr());

      Get.rootDelegate.offNamed(
        Routes.CONTROLL_bOARD_VIEW,
      );
      // change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.error());
      Get.rootDelegate.offNamed(Routes.CONTROLL_bOARD_VIEW);
      Get.snackbar("error", "error");
    });
  }

  updateContractAndFinancial(){
    change(false, status: RxStatus.loading());
    bondPreviewRepository
        .UpdateContractFinancialDetails(contractId!, finanicalEdit)
        .then((value) async{
      bondPreviewRepository
          .UpdateContractDetails(contractId!, contractEdit).then((value){
         onInit();
      }).onError((error, stackTrace) {
        print("UpdateContractDetails ${error}");

        Get.snackbar("خطا", "حصل خطأ ما");
        change(true, status: RxStatus.success());
      });
    }).onError((error, stackTrace) {
      print("UpdateContractFinancialDetails ${error}");
      Get.snackbar("خطا", "حصل خطأ ما");
      change(true, status: RxStatus.success());
    });
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

  RxBool isPaid = false.obs;
  RxBool isDocument = false.obs;

  TextEditingController paymentDeadline = TextEditingController();

  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(ColorCode.blue),
            // Set the primary color to blue
            colorScheme: ColorScheme.light(
                primary:
                    Color(ColorCode.blue)), // Set the color scheme to use blue
          ),
          child: child!,
        );
      },
    );
    return pickedDate;
  }
}

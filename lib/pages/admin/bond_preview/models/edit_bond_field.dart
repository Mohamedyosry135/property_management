import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditBondController{
  int? id;
  TextEditingController? nameEditingController;
  TextEditingController? priceEditingController ;
  TextEditingController? taxAmountEditingController ;
  TextEditingController? totalPriceEditingController ;
  TextEditingController? paymentDeadlineEditingController ;
  RxBool? isPaid;
  RxBool isEdit= false.obs;

  EditBondController({this.id,this.nameEditingController,this.priceEditingController,this.taxAmountEditingController
    ,this.totalPriceEditingController,this.paymentDeadlineEditingController,this.isPaid,});
}
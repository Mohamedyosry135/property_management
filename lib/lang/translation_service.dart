import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension LangEx on CommonLang {
  String tr() {
    return this.name.tr;
  }
}

enum CommonLang {
  search,
  fillEither,
  fillRequiredFields,
  deleteContract,
  contractDetails,
  admins,
  addNewAdmin,
  adminData,
  realstateCount,
  contractCount,
  deletedSuccessfully,
  addedSuccessfully,
  editedSuccesssfully,
  errorChoose,
  edit,
  area,
  invalidMailPassword,
  userRole,
  name,
  welcomeBack,
  enterLoginInformation,
  email,
  invalidMail,
  invalidPassword,
  invalidConfirmPassword,
  notEmpty,
  password,
  login,
  language,
  createNewContract,
  searchByContract,
  controlBoard,
  owners,
  representativeOwner,
  representativeRenter,
  renter,
  tenants,
  tenantRepresentative,
  realEstate,
  maintenanceRequests,
  personalPage,
  signOut,
  totalOwners,
  totalTenants,
  realEstateForRent,
  realEstateForSale,
  contractNumber,
  lessor,
  tenant,
  contractStartingDate,
  contractEndDate,
  amount,
  owner,
  idNumber,
  mobileNumber,
  dateOfBirth,
  signNumber,
  signEndDate,
  addOwner,
  addTenant,
  addOwnerRepresentative,
  addTenantRepresentative,
  addRealEstate,
  propertyName,
  ownerOfProperty,
  instrumentNumber,
  city,
  district,
  propertyUse,
  propertyType,
  orderStatus,
  maintenanceRequest,
  orderNumber,
  orderDate,
  orderDetails,
  profile,
  firstName,
  familyName,
  changePassword,
  currentPassword,
  newPassword,
  newPasswordAgain,
  save,


  addNewOwner,
  ownerData,
  lessorOwner,
  plzWriteFullName,
  recordNumber,
  recordEndDate,
  plzWriteUrMail,
  plzWritePassword,
  add,
  update,
  addNewTenant,
  tenantData,
  nameTenantRepresentative,
  nameOwnerRepresentative,
  dataOwnerRepresentative,
  dataTenantRepresentative,
  realEstateData,
  realEstateName,
  realEstateTypeUse,
  realEstateType,
  realEstateOwner,
  addNewBuilding,
  unitType,
  unitArea,
  home,
  support,
  phone,
  mail,
  address,
  socialMedia,
  sendMessage,
  messageSubject,
  message,
  send,
  contractData,
  contractDuration,
  contractParties,
  buildingData,
  building,
  financialStatements,

  rentalCycle,
  valueRent,
  vat,
  electricityCharges,
  waterFee,
  cleaningFee,
  administrativeFees,
  tamamCompanyPrecentage,

  numberBatches,
  batchValue,
  tax,
  totalFees,
  total,
  duaDate,
  isBond,

  paymentMade,
    batch,
  reqField,
  select,
  bondPreview, bondType, date, notes, delete, addNewDocument,status,paid,notPaid,admin, error,
  monthly,
  quarterly,
  midterm,
  annual,
  batchPreview,
  batchName,
  noBondsFound,
  noBatchesFound,
  deleteUser,
  doYouWantToDelete,
  cancel,
  passwordMoreThanEight,
  numberOfYears

}

class MyLanguages extends Translations {
  Map<String, String> arStrings = {};
  Map<String, String> enStrings = {};

  static const enKey = 'ar';
  static const arKey = 'en';

  @override
  Map<String, Map<String, String>> get keys {

    addString(
    key: CommonLang.search.name, enValue: 'Search', arValue: "بحث");
    addString(
        key: CommonLang.numberOfYears.name, enValue: 'Number of years', arValue: 'عدد السنوات');
    addString(
    key: CommonLang.passwordMoreThanEight.name, enValue: 'password must be more than 8 chars', arValue: 'يجب أن تكون كلمة المرور أكثر من 8 أحرف');
    addString(
    key: CommonLang.deleteUser.name, enValue: 'Delete User', arValue: 'حذف المستخدم');
    addString(
    key: CommonLang.doYouWantToDelete.name, enValue: 'This account may be registered with a contract!', arValue: 'قد يكون هذا الحساب مسجل بعقد!');
    addString(
    key: CommonLang.cancel.name, enValue: 'Cancel', arValue: 'الغاء');
    addString(
    key: CommonLang.noBondsFound.name, enValue: 'No Bonds Found', arValue: 'لا يوجد سندات');
    addString(
    key: CommonLang.noBatchesFound.name, enValue: 'No Batches Found', arValue: 'لا يوجد دفعات');
    addString(
        key: CommonLang.batchName.name, enValue: 'Batch name', arValue: 'اسم الدفعة');
    addString(
        key: CommonLang.batchPreview.name, enValue: 'Batch preview', arValue: 'معاينة الدفعات');
    addString(
    key: CommonLang.fillEither.name, enValue: 'Enter either the record expiry date or record number', arValue: 'ادخل أيا من تاريخ انتهاء السجل او رقم السجل');
    addString(
    key: CommonLang.fillRequiredFields.name, enValue: 'Please enter the mandatory fields', arValue: 'من فضلك ادخل الحقول الاجبارية');
    addString(
    key: CommonLang.deleteContract.name, enValue: 'Delete contract', arValue: 'مسح العقد');
    addString(
        key: CommonLang.contractDetails.name, enValue: 'Contract Details', arValue: 'تفاصيل العقد');
    addString(
        key: CommonLang.admins.name, enValue: 'Admins', arValue: 'المسؤولين');

    addString(
    key: CommonLang.addNewAdmin.name, enValue: 'Add new admin', arValue: 'إضافة مسؤول جديد');
    addString(
    key: CommonLang.adminData.name, enValue: 'Admin data', arValue: 'بيانات المسؤول');

    addString(
    key: CommonLang.contractCount.name, enValue: 'Contract Counts', arValue: 'عدد العقود');addString(
    key: CommonLang.realstateCount.name, enValue: 'RealStates Count', arValue: 'عدد العقارات');
    addString(
        key: CommonLang.monthly.name, enValue: 'Monthly', arValue: 'شهري');
    addString(
        key: CommonLang.quarterly.name, enValue: 'Quarterly', arValue: 'ربع سنوي');
    addString(
        key: CommonLang.midterm.name, enValue: 'Midterm', arValue: 'نصف سنوي');
    addString(
        key: CommonLang.annual.name, enValue: 'Annual', arValue: 'سنوي');
    addString(
    key: CommonLang.deletedSuccessfully.name, enValue: 'Deleted successfully', arValue: 'تم الحذف بنجاح');
    addString(
    key: CommonLang.addedSuccessfully.name, enValue: 'Added successfully', arValue: 'تم الاضافة بنجاح');
    addString(
    key: CommonLang.editedSuccesssfully.name, enValue: 'Modified successfully', arValue: 'تم التعديل بنجاح');
    addString(
    key: CommonLang.errorChoose.name, enValue: 'Please fill in the ID number, date of birth or registration number, and the expiry date of the registration', arValue: 'برجاء ملئ رقم الهوية وتاريخ الميلاد أو رقم السجل و تاريخ انتهاء السجل');
    addString(
        key: CommonLang.error.name, enValue: 'Error', arValue: 'خطأ');
    addString(
        key: CommonLang.edit.name, enValue: 'Update', arValue: 'تعديل');
    addString(
    key: CommonLang.area.name, enValue: 'Area', arValue: 'المساحة');
    addString(
        key: CommonLang.admin.name, enValue: 'Admin', arValue: 'الادمن');
    addString(
        key: CommonLang.renter.name, enValue: 'Renter', arValue: 'المستأجر');

    addString(
        key: CommonLang.invalidMailPassword.name, enValue: 'Invalid email or password', arValue: 'البريد الإلكتروني أو كلمة السر خاطئة');
    addString(
        key: CommonLang.userRole.name, enValue: 'User Role', arValue: 'نوع المستخدم');
    addString(
        key: CommonLang.name.name, enValue: 'Name', arValue: 'الاسم');
    addString(
        key: CommonLang.paid.name, enValue: 'Paid', arValue: 'تم الدفع');
    addString(
        key: CommonLang.notPaid.name, enValue: 'Not Paid', arValue: 'لم يتم الدفع');
    addString(
        key: CommonLang.status.name, enValue: 'Status', arValue: 'الحالة');
    addString(
        key: CommonLang.language.name, enValue: 'Language', arValue: 'اللغة');
    addString(
        key: CommonLang.welcomeBack.name,
        enValue: "Welcome Back",
        arValue: "مرحبا بعودتك");
    addString(
        key: CommonLang.enterLoginInformation.name,
        enValue: "Please enter your login information",
        arValue: "من فضلك ادخل بيانات تسجيل الدخول");
    addString(
        key: CommonLang.email.name,
        enValue: "E-mail",
        arValue: "البريد الالكترونى");
    addString(
        key: CommonLang.invalidMail.name,
        enValue: "Invalid E-Mail",
        arValue: "البريد الالكتروني غير صحيح");
    addString(
        key: CommonLang.invalidPassword.name,
        enValue: "Invalid Password",
        arValue: "الرقم السري غير صحيح");
    addString(
        key: CommonLang.invalidConfirmPassword.name,
        enValue: "Password not matched",
        arValue: "الرقم السري غير متطابق");

    addString(
        key: CommonLang.password.name,
        enValue: "Password",
        arValue: "كـلمة المرور");
    addString(key: CommonLang.login.name, enValue: "Login", arValue: "دخول");
    addString(
        key: CommonLang.createNewContract.name,
        enValue: "Create new contract",
        arValue: "انشاء عقد جديد");
    addString(
        key: CommonLang.update.name,
        enValue: "Update",
        arValue: "تحديث");
    addString(
        key: CommonLang.searchByContract.name,
        enValue: "Search by contract number, customer name",
        arValue: "ابحث برقم العقد ، اسم العميل");
    addString(
        key: CommonLang.controlBoard.name,
        enValue: "Control Board",
        arValue: "لوحة التحكم");
    addString(
        key: CommonLang.representativeOwner.name,
        enValue: "Owner Representative",
        arValue: "ممثل المالك");
    addString(
        key: CommonLang.representativeRenter.name,
        enValue: "Renter Representative",
        arValue: "ممثل المؤجر");
    addString(
        key: CommonLang.renter.name,
        enValue: "Renter",
        arValue: "المؤجر");
    addString(
        key: CommonLang.owners.name, enValue: "The Owners", arValue: "الملاك");
    addString(
        key: CommonLang.tenants.name,
        enValue: "Tenants",
        arValue: "المستاجرين");
    addString(
        key: CommonLang.tenantRepresentative.name,
        enValue: "Tenant representative",
        arValue: "ممثل المستأجر");
    addString(
        key: CommonLang.realEstate.name,
        enValue: "Real estate",
        arValue: "العقارات");
    addString(
        key: CommonLang.maintenanceRequests.name,
        enValue: "Maintenance requests",
        arValue: "طلبات الصيانة");
    addString(
        key: CommonLang.personalPage.name,
        enValue: "Personal page",
        arValue: "الصفحة الشخصيه");
    addString(
        key: CommonLang.signOut.name,
        enValue: "Sign Out",
        arValue: "تسجيل الخروج");
    addString(
        key: CommonLang.totalOwners.name,
        enValue: "Total owners",
        arValue: "اجمالى الملاك");
    addString(
        key: CommonLang.notEmpty.name,
        enValue: "This field cannot be empty",
        arValue: "هذا الحقل لا يمكن ان يكون فارغا");

    addString(
        key: CommonLang.totalTenants.name,
        enValue: "Total tenants",
        arValue: "اجمالى المستأجرين");
    addString(
        key: CommonLang.realEstateForRent.name,
        enValue: "Real estate for rent",
        arValue: "عقارات للإيجار");
    addString(
        key: CommonLang.realEstateForSale.name,
        enValue: "Real estate for sale",
        arValue: "عقارات للبيع");
    addString(
        key: CommonLang.contractNumber.name,
        enValue: "Tenants",
        arValue: "رقم العقد");
    addString(
        key: CommonLang.lessor.name, enValue: "Lessor", arValue: "المؤجر");
    addString(
        key: CommonLang.tenant.name, enValue: "Tenants", arValue: "المستأجر");
    addString(
        key: CommonLang.contractStartingDate.name,
        enValue: "Tenants",
        arValue: "تاريخ بداية العقد");
    addString(
        key: CommonLang.contractEndDate.name,
        enValue: "Tenants",
        arValue: "تاريخ نهاية العقد");
    addString(
        key: CommonLang.amount.name, enValue: "Amount", arValue: "المبلغ");
    addString(key: CommonLang.owner.name, enValue: "Owner", arValue: "المالك");
    addString(
        key: CommonLang.idNumber.name,
        enValue: "ID Number",
        arValue: "رقم الهوية");
    addString(
        key: CommonLang.mobileNumber.name,
        enValue: "Mobile number",
        arValue: "رقم الجوال");
    addString(
        key: CommonLang.dateOfBirth.name,
        enValue: "Date of birth",
        arValue: "تاريخ الميلاد");
    addString(
        key: CommonLang.signNumber.name,
        enValue: "Record number",
        arValue: "رقم السجل");
    addString(
        key: CommonLang.signEndDate.name,
        enValue: "Record end date",
        arValue: "تاريخ انتهاء السجل");
    addString(
        key: CommonLang.addOwner.name,
        enValue: "Add Owner",
        arValue: "اضافة مالك");
    addString(
        key: CommonLang.addTenant.name,
        enValue: "Add Tenant",
        arValue: "اضافة مستأجر");
    addString(
        key: CommonLang.addOwnerRepresentative.name,
        enValue: "Add an owner representative",
        arValue: "اضافة ممثل مالك");
    addString(
        key: CommonLang.addTenantRepresentative.name,
        enValue: "Add a hired representative",
        arValue: "اضافة ممثل مستأجر");
    addString(
        key: CommonLang.addRealEstate.name,
        enValue: "Add a property",
        arValue: "اضافة عقار");
    addString(
        key: CommonLang.propertyName.name,
        enValue: "Name of the property",
        arValue: "اسم العقار");
    addString(
        key: CommonLang.ownerOfProperty.name,
        enValue: "Property Owner ",
        arValue: "مالك العقار");
    addString(
        key: CommonLang.instrumentNumber.name,
        enValue: "Instrument number",
        arValue: "رقم الصك");
    addString(key: CommonLang.city.name, enValue: "City", arValue: "المدينة");
    addString(
        key: CommonLang.district.name, enValue: "District", arValue: "الحي");
    addString(
        key: CommonLang.propertyUse.name,
        enValue: "Type of use of the property",
        arValue: "نوع استخدام العقار");
    addString(
        key: CommonLang.propertyType.name,
        enValue: "Type of property",
        arValue: "نوع العقار");
    addString(
        key: CommonLang.orderStatus.name,
        enValue: "Order status",
        arValue: "حالة الطلب");
    addString(
        key: CommonLang.maintenanceRequest.name,
        enValue: "Maintenance request",
        arValue: "طلب صيانة");

    addString(
        key: CommonLang.orderNumber.name,
        enValue: "Order number",
        arValue: "رقم الطلب");
    addString(
        key: CommonLang.orderDate.name,
        enValue: "Order date",
        arValue: "تاريخ الطلب");
    addString(
        key: CommonLang.orderDetails.name,
        enValue: "Order details",
        arValue: "تفاصيل الطلب");
    addString(
        key: CommonLang.profile.name,
        enValue: "Profile",
        arValue: "الصفحة الشخصية");

    addString(
        key: CommonLang.firstName.name,
        enValue: "First Name",
        arValue: "الاسم الاول");
    addString(
        key: CommonLang.familyName.name,
        enValue: "Family name",
        arValue: "اسم العائلة");
    addString(
        key: CommonLang.changePassword.name,
        enValue: "Change password",
        arValue: "تعديل كلمة المرور");
    addString(
        key: CommonLang.currentPassword.name,
        enValue: "Current Password",
        arValue: "كلمة المرور الحالية");
    addString(
        key: CommonLang.newPassword.name,
        enValue: "New Password",
        arValue: "كلمة المرور الجديدة");
    addString(
        key: CommonLang.newPasswordAgain.name,
        enValue: "New password again",
        arValue: "كلمة المرور الجديدة مرة اخرى");
    addString(key: CommonLang.save.name, enValue: "Save", arValue: "حفظ");

    addString(key: CommonLang.addNewOwner.name, enValue: "Add a new owner", arValue: "اضافة مالك جديد");
    addString(key: CommonLang.ownerData.name, enValue: "Owner data", arValue: "بيانات المالك");
    addString(key: CommonLang.lessorOwner.name, enValue: "Lessor/owner", arValue: "المؤجر / المالك");
    addString(key: CommonLang.plzWriteFullName.name, enValue: "Please write the full name", arValue: "يرجى كتابة الاسم كامل");
    addString(key: CommonLang.recordNumber.name, enValue: "Record number", arValue: "رقم السجل");
    addString(key: CommonLang.recordEndDate.name, enValue: "Record end date", arValue: "تاريخ انتهاء السجل");
    addString(key: CommonLang.plzWriteUrMail.name, enValue: "Please write your email", arValue: "يرجى كتابة البريد الالكترونى");
    addString(key: CommonLang.plzWritePassword.name, enValue: "Please type in the password", arValue: "يرجى كتابة الرقم السرى");
    addString(key: CommonLang.add.name, enValue: "Add", arValue: "اضافة");
    addString(key: CommonLang.addNewTenant.name, enValue: "Add a new tenant", arValue: "اضافة مستأجر جديد");
    addString(key: CommonLang.tenantData.name, enValue: "Tenant data", arValue: "بيانات المستأجر");

    addString(key: CommonLang.nameTenantRepresentative.name, enValue: "The name of the tenant's representative", arValue: "اسم ممثل المستأجر");
    addString(key: CommonLang.nameOwnerRepresentative.name, enValue: "The name of the owner's representative", arValue: "اسم ممثل المالك");
    addString(key: CommonLang.dataOwnerRepresentative.name, enValue: "Data of the owner's representative", arValue: "بيانات ممثل المالك");
    addString(key: CommonLang.dataTenantRepresentative.name, enValue: "Details of the tenant's representative", arValue: "بيانات ممثل المستأجر");

    addString(key: CommonLang.realEstateData.name, enValue: "Real estate data", arValue: "بيانات العقار");
    addString(key: CommonLang.realEstateName.name, enValue: "Real estate name", arValue: "اسم العقار");
    addString(key: CommonLang.realEstateTypeUse.name, enValue: "Type of use of real estate", arValue: "نوع استخدام العقار");
    addString(key: CommonLang.realEstateType.name, enValue: "Type of real estate", arValue: "نوع العقار");
    addString(key: CommonLang.realEstateOwner.name, enValue: "Owner of real estate", arValue: "مالك العقار");
    addString(key: CommonLang.addNewBuilding.name, enValue: "Add new building", arValue: "اضافة عقار جديد");
    addString(key: CommonLang.unitType.name, enValue: "Unit type", arValue: "نوع الوحدة");
    addString(key: CommonLang.unitArea.name, enValue: "Unit area", arValue: "مساحة الوحدة");
    addString(key: CommonLang.select.name, enValue: "Select", arValue: "أختر");

    addString(key: CommonLang.home.name, enValue: "Home", arValue: "الرئيسية");
    addString(key: CommonLang.support.name, enValue: "Contact support", arValue: "تواصل بالدعم");

    addString(key: CommonLang.phone.name, enValue: "phone", arValue: "الهـاتف");
    addString(key: CommonLang.mail.name, enValue: "Home", arValue: "البريد الإلكتروني");
    addString(key: CommonLang.address.name, enValue: "Home", arValue: "العنوان"
        "");
    addString(key: CommonLang.socialMedia.name, enValue: "Home", arValue: "مواقع التواصل الاجتماعى");
    addString(key: CommonLang.sendMessage.name, enValue: "Home", arValue: "ارسل رسالة");
    addString(key: CommonLang.messageSubject.name, enValue: "Home", arValue: "موضوع الرسالة");
    addString(key: CommonLang.message.name, enValue: "Home", arValue: "الرسالة");
    addString(key: CommonLang.send.name, enValue: "Home", arValue: "إرسال");
    addString(key: CommonLang.contractData.name, enValue: "Contract data", arValue: "بيانات العقد");
    addString(key: CommonLang.contractDuration.name, enValue: "Contract Duration", arValue: "مدة العقد");
    addString(key: CommonLang.contractParties.name, enValue: "Contract parties", arValue: "اطراف العقد");

    addString(key: CommonLang.buildingData.name, enValue: "Building data", arValue: "بيانات العقار");
    addString(key: CommonLang.building.name, enValue: "Building", arValue: "العقار");
    addString(key: CommonLang.financialStatements.name, enValue: "Financial Statements", arValue: "البيانات المالية");

    addString(key: CommonLang.rentalCycle.name, enValue: "Rental cycle", arValue: "دورة سداد الايجار");
    addString(key: CommonLang.valueRent.name, enValue: "Value rent", arValue: "قيمة الايجار");
    addString(key: CommonLang.vat.name, enValue: "VAT", arValue: "القيمة شاملة الضريبة");
    addString(key: CommonLang.electricityCharges.name, enValue: "Electricity charges", arValue: "رسوم الكهرباء");
    addString(key: CommonLang.waterFee.name, enValue: "Water fee", arValue: "رسوم الماء");
    addString(key: CommonLang.cleaningFee.name, enValue: "Cleaning fee", arValue: "رسوم النظافة");
    addString(key: CommonLang.administrativeFees.name, enValue: "Administrative fees", arValue: "رسوم ادارية");
    addString(key: CommonLang.tamamCompanyPrecentage.name, enValue: "Tamam Company percentage", arValue: "نسبة شركة تمم");


    addString(key: CommonLang.numberBatches.name, enValue: "The number of batches", arValue: "عدد الدفعات");
    addString(key: CommonLang.batchValue.name, enValue: "Batch value", arValue: "قيمة الدفعة");
    addString(key: CommonLang.tax.name, enValue: "Tax", arValue: "الضريبة");
    addString(key: CommonLang.totalFees.name, enValue: "Total fees", arValue: "اجمالى الرسوم");
    addString(key: CommonLang.total.name, enValue: "Total", arValue: "الاجمالى");
    addString(key: CommonLang.duaDate.name, enValue: "due date", arValue: "موعد الاستحقاق");
    addString(key: CommonLang.paymentMade.name, enValue: "The payment was made", arValue: "تم الدفع");
    addString(key: CommonLang.batch.name, enValue: "Batch", arValue: "الدفعة");
    addString(key: CommonLang.bondPreview.name, enValue: "Bond Preview", arValue: "معاينة السندات");

    addString(key: CommonLang.bondType.name, enValue: "Bond type", arValue: "نوع السند");
    addString(key: CommonLang.date.name, enValue: "Date", arValue: "التاريخ");
    addString(key: CommonLang.notes.name, enValue: "Notes", arValue: "ملاحظات");
    addString(key: CommonLang.delete.name, enValue: "Delete", arValue: "حذف");
    addString(key: CommonLang.addNewDocument.name, enValue: "Add a new document", arValue: "اضافة سند جديد");
    addString(key: CommonLang.reqField.name, enValue: "this field is mandatory", arValue: "هذا الحقل إجباري");


    return {arKey: enStrings, enKey: arStrings};
  }

  addString({required String key, String? enValue, String? arValue}) {
    if (enValue != null) enStrings[key] = enValue;
    if (arValue != null) arStrings[key] = arValue;
  }

  static changeAppLanguage() {
    SharedPreferences.getInstance().then((pref) {
      if (Get.locale!.languageCode == MyLanguages.arKey) {
        pref.setString(CommonLang.language.name, MyLanguages.arKey);
        Get.updateLocale(const Locale(MyLanguages.arKey));
      } else {
        pref.setString(CommonLang.language.name, MyLanguages.arKey);
        Get.updateLocale(const Locale(MyLanguages.arKey));
      }
    });
  }
}

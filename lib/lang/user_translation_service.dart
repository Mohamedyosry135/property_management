import 'package:get/get.dart';
import 'package:property_managment/lang/translation_service.dart';

extension LangEx on UserLang {
  String tr() {
    return name.tr;
  }
}

enum UserLang {
  test,
  requestproperty_managmenth,
  addBeneficiary,
  providerList,
  selectDate,
  selectDateHint,
  numOfOrders,
  wantBeProvider,
  schedule,
  selectBeneficiary,
  selectReason,
  addComments,
  selectPaymentMethod,
  applyCoupon,
  apply,
  priceproperty_managmenth,
  sendRequest,
  payment,
  date,
  reorderAgain,
  progress,
  trackRequest,
  trackOrder,
  property_managmentDone,
  providerEndproperty_managment,
  rateproperty_managment,
  veryGood,
  wrireUrView,
  sendRate,
  rateProvider,
  placeOrder,
  paymentMethod,
  change,
  cardHolder,
  expires,
  paymentTitle,
  transactions,
  creditDebitCard,
  bankAccount,
  newPayment,
  choosePaymentMethod,

  selectDesiredCurrency,
  mail,
  fullNameAccountHolder,
  ibanAccountNumber,
  country,
  city,
  recipientAddress,
  postCode,
  cardNumber,
  nameCard,
  expiryDate,
  add,
  noProvidersAvailble,
  snoProvidersAvailble,
  payWithCard,
  noReviews,
  payWithWallet
}

class UserLanguages extends MyLanguages {
  @override
  Map<String, Map<String, String>> get keys {
    super.keys;
    addString(key: UserLang.test.name, enValue: "info", arValue: "معلومات");

    addString(
        key: UserLang.requestproperty_managmenth.name,
        enValue: "Request property_managmenth",
        arValue: "طلب عمره");
    addString(
        key: UserLang.addBeneficiary.name,
        enValue: 'Add New Beneficiary',
        arValue: 'إضافة مستفيد جديد');
    addString(
        key: UserLang.providerList.name,
        enValue: 'Provider List',
        arValue: 'قائمة مقدمى الخدمة');
    addString(
        key: UserLang.selectDate.name,
        enValue: 'Select Date',
        arValue: 'أختر تاريخ');
    addString(
        key: UserLang.selectDateHint.name,
        enValue: 'You can select one day or multi days',
        arValue: 'يمكنك تحديد يوم واحد أو عدة أيام');
    addString(
        key: UserLang.numOfOrders.name,
        enValue: 'No. of orders: ',
        arValue: 'عدد الطلبات: ');
    addString(
        key: UserLang.wantBeProvider.name,
        enValue: 'Want to be provider with us',
        arValue: 'تريد أن تكون مزود معنا');
    addString(
        key: UserLang.schedule.name,
        enValue: 'Schedule ',
        arValue: 'جدول مواعيد');
    addString(
        key: UserLang.selectBeneficiary.name,
        enValue: 'Select Beneficiary ',
        arValue: 'حدد المستفيد');
    addString(
        key: UserLang.selectReason.name,
        enValue: 'Select Reason',
        arValue: 'حدد السبب');
    addString(
        key: UserLang.addComments.name,
        enValue: 'Add Comments',
        arValue: 'أضف التعليقات');
    addString(
        key: UserLang.selectPaymentMethod.name,
        enValue: 'Select payment method',
        arValue: 'اختار طريقة الدفع');
    addString(
        key: UserLang.applyCoupon.name,
        enValue: 'Apply coupon',
        arValue: 'تطبيق القسيمة');
    addString(key: UserLang.apply.name, enValue: 'Apply', arValue: 'تنفيذ');
    addString(
        key: UserLang.priceproperty_managmenth.name,
        enValue: 'Price property_managmenth',
        arValue: 'سعر العمره');
    addString(
        key: UserLang.sendRequest.name,
        enValue: 'Send request',
        arValue: 'أرسل الطلب');
    addString(key: UserLang.payment.name, enValue: 'Payment:', arValue: 'دفع:');
    addString(key: UserLang.date.name, enValue: 'Date:', arValue: 'التاريخ:');
    addString(
        key: UserLang.reorderAgain.name,
        enValue: 'Reorder again',
        arValue: 'إعادة الحجز:');
    addString(
        key: UserLang.progress.name, enValue: 'Progress', arValue: 'تقدم');
    addString(
        key: UserLang.trackRequest.name,
        enValue: 'Track Request',
        arValue: 'تتبع الطلب');
    addString(
        key: UserLang.trackOrder.name,
        enValue: 'Track Order',
        arValue: 'تتبع مسار الطلب');
    addString(
        key: UserLang.property_managmentDone.name,
        enValue: 'property_managment done',
        arValue: 'انتهت العمرة');
    addString(
        key: UserLang.payWithWallet.name,
        enValue: 'Pay with Wallet',
        arValue: 'الدفع بالمحفظة');
    addString(
        key: UserLang.providerEndproperty_managment.name,
        enValue: 'Provider end the property_managment you can rate his service',
        arValue: 'المزود أنهى العمرة يمكنك تقييم خدمته');
    addString(
        key: UserLang.rateproperty_managment.name,
        enValue: 'Rate the property_managment',
        arValue: 'قيم العمرة');
    addString(
        key: UserLang.veryGood.name, enValue: 'Very Good', arValue: 'جيد جدا');
    addString(
        key: UserLang.wrireUrView.name,
        enValue: 'Write your review',
        arValue: 'اكتب مراجعتك');
    addString(
        key: UserLang.sendRate.name,
        enValue: 'Send Your rate',
        arValue: 'أرسل تقييمك');
    addString(
        key: UserLang.rateProvider.name,
        enValue: 'Rate the Provider',
        arValue: 'قييم المزود');
    addString(
        key: UserLang.placeOrder.name,
        enValue: 'Place Order',
        arValue: 'تقديم الطلب');
    addString(
        key: UserLang.paymentMethod.name,
        enValue: 'Payment method',
        arValue: 'طريقة الدفع');
    addString(key: UserLang.change.name, enValue: 'Change', arValue: 'تغيير');

    addString(
        key: UserLang.cardHolder.name,
        enValue: 'Card Holder',
        arValue: 'حامل البطاقة');
    addString(key: UserLang.expires.name, enValue: 'Expires', arValue: 'تنتهي');
    addString(key: UserLang.noReviews.name, enValue: 'No reviews for now', arValue: 'لا يوجد تقيمات ف الوقت الحالي');
    addString(
        key: UserLang.paymentTitle.name, enValue: 'Payment', arValue: 'الدفع');

    addString(
        key: UserLang.transactions.name,
        enValue: 'Transactions',
        arValue: 'المعاملات');
    addString(
        key: UserLang.creditDebitCard.name,
        enValue: 'Credit Card/Debit Card',
        arValue: 'بطاقة الائتمان بطاقة الخصم');
    addString(
        key: UserLang.bankAccount.name,
        enValue: 'Bank Account',
        arValue: 'حساب البنك');
    addString(
        key: UserLang.newPayment.name,
        enValue: 'New Payment',
        arValue: 'طريقة دفع جديدة');
    addString(
        key: UserLang.choosePaymentMethod.name,
        enValue: 'Select Payment method',
        arValue: 'اختار طريقة الدفع');
    addString(
        key: UserLang.payWithCard.name,
        enValue: 'Pay with Card',
        arValue: 'دفع بالكارت');
    addString(
        key: UserLang.selectDesiredCurrency.name,
        enValue: 'Select the desired currency',
        arValue: 'حدد العملة المطلوبة');
    addString(
        key: UserLang.mail.name,
        enValue: 'E-mail',
        arValue: 'البريد الإلكتروني');
    addString(
        key: UserLang.fullNameAccountHolder.name,
        enValue: 'Full name of the account holder',
        arValue: 'الاسم الكامل لصاحب الحساب');
    addString(
        key: UserLang.ibanAccountNumber.name,
        enValue: 'IBAN / Account Number',
        arValue: 'IBAN / رقم الحساب');

    addString(
        key: UserLang.country.name, enValue: 'Country', arValue: 'الدولة');
    addString(key: UserLang.city.name, enValue: 'City', arValue: 'المدينة');
    addString(
        key: UserLang.recipientAddress.name,
        enValue: 'Recipient Address',
        arValue: 'عنوان المستلم');
    addString(
        key: UserLang.postCode.name,
        enValue: 'Post Code',
        arValue: 'الرمز البريدي');
    addString(
        key: UserLang.cardNumber.name,
        enValue: 'Card Number',
        arValue: 'رقم البطاقة');
    addString(
        key: UserLang.nameCard.name,
        enValue: 'Name Card',
        arValue: 'بطاقة الاسم');
    addString(
        key: UserLang.expiryDate.name,
        enValue: 'Expiry Date',
        arValue: 'تاريخ انتهاء الصلاحية');
    addString(key: UserLang.add.name, enValue: 'Add', arValue: 'أضـف');
    addString(
        key: UserLang.noProvidersAvailble.name,
        enValue: 'No providers Availble in\nThe Selcted Date',
        arValue: 'لا يوجد مزودين متوفرون في\nالتاريخ المحدد');

    return {MyLanguages.arKey: enStrings, MyLanguages.enKey: arStrings};
  }
}

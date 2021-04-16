import 'dart:convert';
import 'package:aesthenics/api/api_base_helper.dart';
import 'package:aesthenics/utils/Constants.dart';
import 'package:dio/dio.dart';

class ApiServiceProvider {
  ApiBaseHelper _helper = ApiBaseHelper();

/*
  Future<Login> loginApi(String mobileNumber, String password) async {
    var body = {};
    body[Constants.MobileNumber] = mobileNumber;
    body[Constants.Password] = password;
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/login", json.encode(body), false);
    return Login.fromJson(response);
  }

  Future<String> registerApi(String mobileNumber, bool isBusiness,
      String password, String cPassword) async {
    var body = {};
    body[Constants.MobileNumber] = mobileNumber;
    body[Constants.Password] = password;
    body[Constants.ConfirmPassword] = cPassword;
    body[Constants.IsBusiness] = isBusiness;
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/Register", json.encode(body), true);
    return response.toString();
  }

  Future<Login> updateUserApi(
      UpdateUserRequest request, bool isBusiness) async {
    var body = {};
    if (isBusiness) {
      body[Constants.name] = request.name;
      body[Constants.BusinessCategoryId] = request.BusinessCategoryId;
      body[Constants.gstNumber] = request.gstNumber;
      body[Constants.Email] = request.Email;
    }

    body[Constants.firstName] = request.firstName;
    body[Constants.lastName] = request.lastName;
    body[Constants.birthDate] = request.birthDate;
    body[Constants.gender] = request.gender;
    body[Constants.address] = request.address;
    body[Constants.city] = request.city;
    body[Constants.tahsil] = request.tahsil;
    body[Constants.district] = request.district;
    body[Constants.pinCode] = request.pinCode;
    body[Constants.Base64ImageData] = request.Base64ImageData;
    body[Constants.panNumber] = request.panNumber;
    body[Constants.AadharNumber] = request.aadharNumber;
    body[Constants.StateId] = request.StateId;
    body[Constants.DeviceToken] = request.DeviceToken;
    body[Constants.IsApple] = request.IsApple;

    print(json.encode(body).toString());
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/UpdateUser", json.encode(body), true);
    return Login.fromJson(response);
  }

  Future<String> forgotApi(String mobileNumber) async {
    final response = await _helper.apiCallRequest(Constants.GET,
        "user/ForgetPassword?MobileNumber=$mobileNumber", "", true);
    return response.toString();
  }

  Future<String> verifyOtpApi(String otp) async {
    final response = await _helper.apiCallRequest(
        Constants.GET, "user/VerifyOTP?OTP=$otp", "", true);
    return response.toString();
  }

  Future<String> addAccountApi(AccountItem request) async {
    var body = {};
    body[Constants.BankName] = request.b_name;
    body[Constants.AccountNumber] = request.ac_no;
    body[Constants.ConfirmAccountNumber] = request.confirm_ac_no;
    body[Constants.IFSCCode] = request.IFSCCode;
    body[Constants.UPIID] = request.UPIID;
    body[Constants.IsPreferred] = request.IsPreferred;
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/AddAccount", json.encode(body), true);
    return response.toString();
  }

  Future<List<BankAccount>> bankAccountsApi(int skip) async {
    final response = await _helper.apiCallRequest(Constants.GET,
        "User/GetUserBankAccounts?skip=$skip&take=10", "", false);
    return List<BankAccount>.from(response.map((i) => BankAccount.fromJson(i)));
  }

  Future<List<TicketCategory>> ticketCategoriesApi() async {
    final response = await _helper.apiCallRequest(Constants.GET,
        "User/GetSupportTicketCategories?skip=0&take=10", "", false);
    return List<TicketCategory>.from(
        response.map((i) => TicketCategory.fromJson(i)));
  }

  Future<String> addSupportTicketApi(String topic, String issue, int id) async {
    var body = {};
    body[Constants.Subject] = topic;
    body[Constants.Issue] = issue;
    body[Constants.SupportTicketCategoryId] = id;
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/AddSupportTicket", json.encode(body), true);
    return response.toString();
  }

  Future<String> addBeneficiaryApi(BeneficiaryItem item) async {
    var body = {};
    body[Constants.BeneficiaryType] = item.BeneficiaryType;
    body[Constants.MobileNumber] = item.MobileNumber;
    body[Constants.EmailAddress] = item.email;
    body[Constants.AccountNumber] = item.AccountNumber;
    body[Constants.ConfirmAccountNumber] = item.ConfirmAccountNumber;
    body[Constants.IFSCCode] = item.IFSCCode;
    body[Constants.UPIID] = item.UPIID;
    body[Constants.gstNumber] = item.gstNumber;
    body[Constants.Name] = item.name;
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/AddBeneficiary", json.encode(body), true);
    return response.toString();
  }

  Future<List<SupportTicket>> supportTicketsApi(int skip) async {
    final response = await _helper.apiCallRequest(
        Constants.GET, "User/GetSupportTickets?skip=$skip&Take=10", "", false);
    return List<SupportTicket>.from(
        response.map((i) => SupportTicket.fromJson(i)));
  }

  Future<List<Beneficiary>> beneficiaryApi(bool type, int skip) async {
    final response = await _helper.apiCallRequest(Constants.GET,
        "User/GetBeneficiaries?type=$type&skip=$skip&take=10", "", false);
    return List<Beneficiary>.from(response.map((i) => Beneficiary.fromJson(i)));
  }

  Future<List<InvoiceItem>> invoicesApi(bool receive, int skip) async {
    final response = await _helper.apiCallRequest(
        Constants.GET,
        "User/GetBusinessInvoice?receive=$receive&skip=$skip&Take=10",
        "",
        false);
    return List<InvoiceItem>.from(response.map((i) => InvoiceItem.fromJson(i)));
  }

  Future<String> addInvoiceApi(InvoiceRequest item) async {
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/SaveBusinessInvoice", item.toJson(), true);
    return response.toString();
  }

  Future<String> getClientIdApi(InvoiceRequest item) async {
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/GetBeneficiary", item.toJson(), true);
    return response.toString();
  }

  Future<TransactionResponse> saveTransactionApi(TransactionRequest item) async {
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/SaveTransaction", item.toJson(), false);
    return TransactionResponse.fromJson(response);
  }

  Future<List<Beneficiary>> allBeneficiaryApi(int skip) async {
    final response = await _helper.apiCallRequest(Constants.GET,
        "User/GetClients?skip=$skip&Take=10&SearchKey=", "", false);
    return List<Beneficiary>.from(response.map((i) => Beneficiary.fromJson(i)));
  }

  Future<List<Transaction>> transactionsApi(int skip) async {
    final response = await _helper.apiCallRequest(
        Constants.GET, "User/GetTransactions?skip=$skip&Take=10", "", false);
    return List<Transaction>.from(response.map((i) => Transaction.fromJson(i)));
  }
  Future<AppSecret> appSecretApi() async {
    final response = await _helper.apiCallRequest(
        Constants.GET, "User/GetCashfreeAppIdAndSecretKey?paymentMode=live", "", false);
    return AppSecret.fromJson(response);
  }

  Future<String> deleteAccountApi(int id) async {
    final response = await _helper.apiCallRequest(
        Constants.DELETE, "User/DeleteAccount?AccountId=$id", "", true);
    return response.toString();
  }

  Future<String> deleteBeneficiaryApi(int id) async {
    final response = await _helper.apiCallRequest(
        Constants.DELETE, "User/DeleteBeneficiary?BeneficiaryId=$id", "", true);
    return response.toString();
  }

  Future<String> uploadImagesApi(String aadhar, String pan) async {
    var body = {};
    body[Constants.AddharBase64ImageData] = aadhar;
    body[Constants.PanBase64ImageData] = pan;
    print(json.encode(body).toString());
    final response = await _helper.apiCallRequest(
        Constants.POST, "user/UpdateUserImage", json.encode(body), true);
    return response.toString();
  }

  */
/*
  * Production - set the URL tohttps://api.cashfree.com/api/v2/cftoken/order
Testing - set the URL to https://test.cashfree.com/api/v2/cftoken/order*//*

  Future<CFToken> makePaymentApi(String id,String amount,String currency) async {
    var body = {};
    body[Constants.orderId] = id;
    body[Constants.orderAmount] = amount;
    body[Constants.orderCurrency] = currency;
    final response = await _helper.apiCallRequest(
        Constants.POST, "https://test.cashfree.com/api/v2/cftoken/order", json.encode(body), false);
    return CFToken.fromJson(response);
  }

  Future<List<PaymentType>> paymentTypesApi() async {
    final response = await _helper.apiCallRequest(
        Constants.GET, "User/GetPaymentTypes?skip=0&take=100", "", false);
    return List<PaymentType>.from(response.map((i) => PaymentType.fromJson(i)));
  }
 Future<CasherFee> casherFeeApi(double amount) async {
    final response = await _helper.apiCallRequest(
        Constants.GET, "User/GetCasherFee?Amount=$amount&paymentMode=bank", "", false);
    return CasherFee.fromJson(response);
 }
*/

}

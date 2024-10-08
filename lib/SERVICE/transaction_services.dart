part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>>
  getTransactions(
      {http.Client? client}) async {
      client ??= http.Client();
      String url = baseURL + '/transaction';

      print("URL Transaction : $url");
      var response = await client.get(Uri.parse(url),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${User.token}',
      }
      );
      print(User.token);
      print("Response Transaction : ${response.body}");

      if(response.statusCode != 200){
        return ApiReturnValue(message: "Failed to get transaction");
      }
      var data = jsonDecode(response.body);
      List<Transaction> transaction = (data['data']['data']
      as Iterable).map((e)=> Transaction.fromJson(e)).toList();

      return ApiReturnValue(value: transaction);

  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction, {http.Client? client}) async {
    // await Future.delayed(Duration(seconds: 2));
    client ??= http.Client();
    String url = baseURL + '/checkout';
    print("URL SUBMIT TRANSACTION : $url");
    var response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${User.token}',
      },
      body: jsonEncode({
        'food_id': transaction.food!.id,
        'user_id': transaction.user!.id,
        'quantity': transaction.quantity,
        'total': transaction.total,
        'status': 'PENDING',
      }),
    );
    print("Response submit transaction : ${response.body}");
    if (response.statusCode != 200){
      return ApiReturnValue(message: "failed to submit");
    }

    var data = jsonDecode(response.body);
    Transaction submit = Transaction.fromJson(data['data']);
    return ApiReturnValue(value: submit);
    // Assuming you want to return the updated list of transactions after submitting
    return ApiReturnValue(
      value: transaction.copyWith(
        id: 123,
        status: TransactionStatus.pending,
        total: (transaction.quantity! * transaction.food!.price! * 1.1).toInt(),
      ),
    );
  }
}

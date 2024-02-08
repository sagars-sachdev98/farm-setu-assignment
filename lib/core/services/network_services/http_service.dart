abstract class HttpService {
  Future<Map<String, dynamic>?> handleGetRequest(String endPoint,
      {Map<String, dynamic> queryParameters = const {},
      Function()? onError,
      bool addApiKey = true});

  Future<List<Map<String, dynamic>>> handleGetRequestList(String endPoint,
      {Map<String, dynamic> queryParameters = const {},
      Function()? onError,
      bool addApiKey = true});

  // Future<Response> handlePostRequest(String endPoint, dynamic data,
  //     {Map<String, dynamic> queryParameters = const {}, Function()? onError});

  // Future<Response> handlePostRequestList(String endPoint, List<dynamic>? data,
  //     {Map<String, dynamic> queryParameters = const {}, Function()? onError});

  // Future<Response> handlePutRequest(String endPoint,
  //     {Map<String, dynamic>? data,
  //     Map<String, dynamic> queryParameters = const {},
  //     Function()? onError});

  // Future<Response> handleDeleteRequest(String endPoint,
  //     {Map<String, dynamic> queryParameters = const {}, Function()? onError});
}

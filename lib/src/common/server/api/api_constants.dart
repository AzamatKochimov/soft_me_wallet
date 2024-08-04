class ApiConst {
  static const connectionTimeout = 20000;
  static const sendTimeout = 20000;

  static const baseUrl = 'https://online.atomic.uz/';
  static const version = '';

  // Courses api
  static const login = '/api/login';

}

class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}

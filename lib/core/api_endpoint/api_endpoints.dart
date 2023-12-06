class ApiEndPoints {
  static final String baseUrl =
      'https://b721-103-124-115-148.ngrok-free.app/api/readers/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'register';
  final String registerSSO = 'register';
  final String loginEmail = 'login';
  final String loginSSO = 'login';
  final String categories = 'categories';
}

class ApiEndPoints {
  static final String baseUrl =
      //https://8d60-103-124-115-148.ngrok-free.app/api/contents/categories/2
      'https://sandbox-nooz.digiprimatera.co.id/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _CategoryEndPoints categoryEndpoints = _CategoryEndPoints();
  static _ContentEndPoints contentEndpoints = _ContentEndPoints();
  static _SearchEndPoints searchEndpoints = _SearchEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'readers/register';
  final String registerSSO = 'readers/registersso';
  final String loginEmail = 'readers/login';
  final String loginSSO = 'readers/loginsso';
}

class _SearchEndPoints {
  final String registerEmail = 'search';
}

class _CategoryEndPoints {
  final String categories = 'categories';
  final String saveFavouriteCategory = 'reader-category';
  final String readersCategory = 'readers';
}

class _ContentEndPoints {
  final String CategoryContent = 'contents/categories';
  final String RecommendedContent = 'contents/recommendation';
  final String TrendingContent = 'contents/trending';
  final String SuggestedContent = 'contents/suggested';
  final String DetailContent = 'contents/single';
}

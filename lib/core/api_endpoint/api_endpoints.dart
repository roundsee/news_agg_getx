class ApiEndPoints {
  static final String baseUrl =
      //https://8d60-103-124-115-148.ngrok-free.app/api/contents/categories/2
      'https://sandbox-nooz.digiprimatera.co.id/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _CategoryEndPoints categoryEndpoints = _CategoryEndPoints();
  static _ContentEndPoints contentEndpoints = _ContentEndPoints();
  static _SearchEndPoints searchEndpoints = _SearchEndPoints();
  static _HistoryEndPoints historyEndpoints = _HistoryEndPoints();
  static _InteractionEndPoints interactionEndpoints = _InteractionEndPoints();
  static _ReaderEndPoints readersEndpoints = _ReaderEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'readers/register';
  final String registerSSO = 'readers/registersso';
  final String loginEmail = 'readers/login';
  final String loginSSO = 'readers/loginsso';
  final String logout = 'readers/logout';
  final String profile = 'readers/profile';
}

class _ReaderEndPoints {
  final String updateProfile = 'readers/change-profile';
  final String changePhoto = 'readers/change-photo';
  final String changePassword = 'readers/change-password';
}

class _SearchEndPoints {
  final String searchtext = 'search';
}

class _InteractionEndPoints {
  final String like = 'interaction/like';
  final String save = 'interaction/save';
  final String share = 'interaction/share';
}

class _HistoryEndPoints {
  final String history = 'history';
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

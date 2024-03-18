class ApiTimeOutDuration {
  static const Duration apiTimeOutDuration = Duration(seconds: 25);
}

class Apis {
  static const String Api_key = '22eccbef';
  static const String getMovies = 'http://www.omdbapi.com/?s=Batman&apikey=$Api_key&page=';
}

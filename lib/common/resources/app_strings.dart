//contain string of applications
class AppStrings {
  static final AppStrings _resource =
      AppStrings._internal(); //create global instace of the class

  factory AppStrings() =>
      _resource; //factpry constructor responsible for the object creation of the class

  AppStrings._internal(); //private constructor

  String get app_title => 'Movies';
   String get offline_db_name => 'movies_app_db';
   String get offline_box_name => 'MOVIE_BOX';
  String get long_txt =>
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae justo eget urna scelerisque ornare.Duis at ultricies ex. Nulla posuere augue sit amet nibh vehicula varius. Sed congue tortor a dui pretium feugiat.\n Donec nec nisl nec purus congue bibendum a nec tortor.';
}

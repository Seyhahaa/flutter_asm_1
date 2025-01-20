class Language{
  String get appName => 'Instagram';
  String get like => 'Likes';
  String get date => 'days ago';
  String get more => 'more';
  String get address => 'chaktomuk Conference Hall';
}

class LanguageKh extends Language{
  @override
  String get appName => 'អ៊ិនស្តាក្រាម';
  @override
  String get like => 'ចូលចិត្ត';
  @override
  String get date => 'ថ្ងៃមុន';
  @override
  String get more => 'ច្រើនទៀត';
  @override
  String get address => 'សាលសន្និបាតចតុមុខ';
}
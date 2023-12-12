part of 'drawer_widget.dart';

class _DrawerProvider extends BaseProvider {
  _DrawerProvider({required super.context});

  late SupportedLanguage selectedLanguage;
  bool langTileExpanded = false;

  @override
  void initState() {

    super.initState();
    selectedLanguage = calendarPreference.appLanguage;
    notifyListeners();
  }
  void changeLanguage(SupportedLanguage? lang) {
    if (lang != null) {

      selectedLanguage = lang;
      context.read<LanguageProvider>().changeLanguage(selectedLanguage);
      notifyListeners();
    }
  }
  void toggleLangTile(){
    langTileExpanded = !langTileExpanded;

    notifyListeners();
  }
}

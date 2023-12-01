part of 'drawer_widget.dart';

class _DrawerProvider extends BaseProvider {
  _DrawerProvider({required super.context});

  SupportedLanguage selectedLanguage = SupportedLanguage.english;
  bool langTileExpanded = false;
  void changeLanguage(SupportedLanguage? lang) {
    if (lang != null) {

      selectedLanguage = lang;
      context.read<LanguageProvider>().changeLanguage(Locale(selectedLanguage.value));
      notifyListeners();
    }
  }
  void toggleLangTile(){
    langTileExpanded = !langTileExpanded;

    notifyListeners();
  }
}

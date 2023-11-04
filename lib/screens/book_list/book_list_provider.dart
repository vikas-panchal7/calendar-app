part of 'book_list_ui.dart';

class BookListProvider extends BaseProvider {
  BookListProvider({required super.context});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

}

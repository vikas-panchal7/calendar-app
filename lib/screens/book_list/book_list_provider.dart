part of 'book_list.dart';

class BookListProvider extends BaseProvider {
  BookListProvider({required super.context});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

}

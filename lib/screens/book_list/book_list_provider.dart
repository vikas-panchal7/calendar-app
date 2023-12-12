part of 'book_list.dart';

base class BookListProvider extends BaseProvider implements PaginationHelper<BookInfo?> {
  BookListProvider({required super.context, required this.bookRepository, required this.loadingHandler}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      init();
    });
    eventBus.on<BookUpdateEvent>().listen(_onBookUpdate);
    eventBus.on<BookDeleteEvent>().listen(_onBookDelete);
    eventBus.on<BookAddEvent>().listen(_onBookAdd);
  }

  final BookRepository bookRepository;
  final LoadingDialogHandler loadingHandler;

  // final EventBus eventBus;

  DocumentSnapshot? _lastDocument;
  List<BookInfo?> _list = [];
  bool _isLoading = true;
  bool _isAvailableMore = false;

  @override
  bool get isLoading => _isLoading;

  bool get isAvailableMore => _isAvailableMore;

  @override
  DocumentSnapshot? get lastDocument => _lastDocument;

  @override
  List<BookInfo?> get list => _list;

  @override
  Future<void> onLoadMore() async {
    if (_isLoading || !_isAvailableMore) {
      return;
    }
    init();
  }

  @override
  Future<void> onReload() async {
    if (_isLoading) {
      return;
    }
    _list = [];
    _lastDocument = null;
    _isAvailableMore = true;
    notifyListeners();
    init();
  }

  void viewPdf(BookInfo? bookInfo) {
    context.navigator.pushNamed(CustomPdfView.routeName,
        arguments: CustomPdfViewArg(pdfPath: bookInfo?.fileUrl ?? '', title: bookInfo?.title.translate(context) ?? ''));
  }

  void init() async {
    var result = await processApi(
      process: () {
        return bookRepository.getBookList(lastDocument: _lastDocument);
      },
      loadingHandler: (loading) {
        _isLoading = loading;
        notifyListeners();
      },
    );

    if (result.data.isNotEmpty) {
      _list = [..._list, ...result.data];
      _lastDocument = result.lastDocument;
      _isAvailableMore = result.isAvailableMore;
      notifyListeners();
    }
  }

  void _onBookUpdate(BookUpdateEvent event) {
    debugPrint('Listen');
    int position = _list.indexWhere((element) => element?.id == event.bookInfo.id);
    _list.removeAt(position);
    _list = [..._list]..insert(position, event.bookInfo);
    // _list[position] = event.bookInfo;
    notifyListeners();
  }

  void _onBookAdd(BookAddEvent event) {
    _list = [event.bookInfo, ..._list];
    notifyListeners();
  }

  void _onBookDelete(BookDeleteEvent event) {
    int position = _list.indexWhere((element) => element?.id == event.id);
    _list = [..._list]..removeAt(position);
    notifyListeners();
  }

  Future<void> deleteBook(String id) async {
    bool result = await processApi(
        process: () async => bookRepository.deleteBook(id: id), loadingHandler: loadingHandler.handleBgDialog);
    if (result) {
      if (context.mounted) {
        context.showSuccessSnackBar(message: context.l10n.bookDeletedSuccessfully);
      }
    }
  }
}

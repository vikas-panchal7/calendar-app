part of 'user_list.dart';

class UserListProvider extends BaseProvider implements PaginationHelper<UserDataInfo?> {
  final UserRepository userRepository;
  final LoadingDialogHandler loadingHandler;
  UserListProvider( {required super.context,required this.userRepository, required this.loadingHandler,});

  bool _isLoading = true;
  bool _isAvailableMore = false;
  DocumentSnapshot? _lastDocument;
  List<UserDataInfo?> _list = [];
  @override
  void initState() {
    super.initState();

    init();
  }



  @override
  bool get isLoading => _isLoading;

  bool get isAvailableMore => _isAvailableMore;

  @override
  DocumentSnapshot<Object?>? get lastDocument => _lastDocument;

  @override

  List<UserDataInfo?> get list => _list;

  @override
  Future<void> onLoadMore() async{
    if (_isLoading || !_isAvailableMore) {
      return;
    }
    init();
  }

  @override
  Future<void> onReload() async{
    if (_isLoading) {
      return;
    }
    _list = [];
    _lastDocument = null;
    _isAvailableMore = true;
    notifyListeners();
    init();
  }



  void init() async {
    var result = await processApi(
      process: () {
        return userRepository.getUserList(lastDocument: _lastDocument);
      },
      loadingHandler: (loading) {
        _isLoading = loading;
        notifyListeners();
      },
    );

    if (result.data.isNotEmpty) {
      print('result.data ===> ${result.data}');
      _list = [..._list, ...result.data];
      _lastDocument = result.lastDocument;
      _isAvailableMore = result.isAvailableMore;
      notifyListeners();
    }
  }

}

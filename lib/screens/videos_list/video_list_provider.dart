part of 'video_list.dart';

class VideoListProvider extends BaseProvider implements PaginationHelper {
  VideoListProvider({required this.videoRepository, required this.loadingHandler, required super.context}) {
    init();
    eventBus.on<VideoAddEvent>().listen(_onVideoAdd);
    eventBus.on<VideoDeleteEvent>().listen(_onVideoDelete);
  }

  final VideoRepository videoRepository;
  final LoadingDialogHandler loadingHandler;

  DocumentSnapshot? _lastDocument;
  List<VideoInfo?> _list = [];
  bool _isLoading = true;
  bool _isAvailableMore = false;

  @override
  bool get isLoading => _isLoading;

  bool get isAvailableMore => _isAvailableMore;

  @override
  DocumentSnapshot? get lastDocument => _lastDocument;

  @override
  List<VideoInfo?> get list => _list;

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

  void init() async {
    var result = await processApi(
      process: () {
        return videoRepository.getVideoList(lastDocument: _lastDocument);
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

  void _onVideoAdd(VideoAddEvent event) {
    print('listen');
    _list = [event.videoInfo, ..._list];
    notifyListeners();
  }

  void _onVideoDelete(VideoDeleteEvent event) {
    print('listen');
    int position = _list.indexWhere((element) => element?.id == event.id);
    _list = [..._list]..removeAt(position);
    notifyListeners();
  }

  Future<void> deleteVideo(String id) async {
    bool result = await processApi(
        process: () async => videoRepository.deleteVideo(id: id), loadingHandler: loadingHandler.handleDialog);
    if (result) {
      if (context.mounted) {
        context.navigator.pop();
        context.showSuccessSnackBar(message: 'Book Deleted Successfully');
      }
    }
  }
}

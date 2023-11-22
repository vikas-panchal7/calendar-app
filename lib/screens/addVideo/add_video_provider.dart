part of 'add_video.dart';

class AddVideoProvider extends BaseProvider {
  final VideoInfo? videoInfo;
  final VideoRepository videoRepository;
  final LoadingDialogHandler loadingHandler;

  AddVideoProvider({
    required super.context,
    required this.videoInfo,
    required this.videoRepository,
    required this.loadingHandler,
  });

  bool _isEdit = false;

  bool get isEdit => _isEdit;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _urlText = TextEditingController();

  TextEditingController get urlText => _urlText;

  void handleUpload() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        addVideo();
      }
    }
  }

  void handleDelete() {
    DeleteDialog.show(
      context: context,
      type: AppStrings.video,
      onDelete: () {
        context.navigator.pop();
        context.navigator.pop();
      },
    );
  }

  void viewVideo() {}

  Future<void> addVideo() async {
    bool? result = await processApi(
        process: () async {
          for (int i = 0; i < 65; i++) {
            var id = videoInfo?.id ?? videoRepository.getVideoId();

            await videoRepository.addEditVideo(
              videoUrl: _urlText.text,
              createdAt: videoInfo?.createdAt ?? DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              id: id,
            );
          }
          return true;
        },
        loadingHandler: loadingHandler.handleDialog);

    if (result ?? false) {
      if (context.mounted) {
        context.showSuccessSnackBar(message: 'Video ${_isEdit ? "Edited" : "added"} successfully');
        if (_isEdit) {
          context.navigator.pop(false);
        } else {
          context.navigator.pop(true);
        }
      }
    }
  }
}

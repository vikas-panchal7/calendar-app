part of 'add_calendar_data.dart';

class AddCalendarDataProvider extends BaseProvider {
  final CalendarDateInfo? calendarDataInfo;
  final CalendarRepository calendarRepository;
  final LoadingDialogHandler loadingDialogHandler;
  final DateTime calendarDate;
  AddCalendarDataProvider( {
    required super.context,
    required this.calendarDataInfo,
    required this.calendarRepository,
    required this.loadingDialogHandler,
    required this.calendarDate,
  }) {
    if (calendarDataInfo != null) {
      init();
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _engTitle = TextEditingController();

  final TextEditingController _gujTitle = TextEditingController();
  final TextEditingController _gujDescription = TextEditingController();
  final TextEditingController _engDescription = TextEditingController();
  final TextEditingController _videoUrl = TextEditingController();
  int _selectedSource = 0;
  bool _isEdit = false;

  bool get isEdit => _isEdit;

  TextEditingController get videoUrl => _videoUrl;

  TextEditingController get gujDescription => _gujDescription;

  TextEditingController get engDescription => _engDescription;

  TextEditingController get engTitle => _engTitle;

  TextEditingController get gujTitle => _gujTitle;

  int get selectedSource => _selectedSource;

  void handleDeleteData() {
    DeleteDialog.show(
      context: context,
      type: AppStrings.data,
      onDelete: () {
        context.navigator.pop();
        context.navigator.pop();
      },
    );
  }

  Future<bool> onWillPop() async {
    if (engTitle.text.isNotEmpty ||
        gujTitle.text.isNotEmpty ||
        gujDescription.text.isNotEmpty) {
      DiscardDialog.show(context: context);
      return false;
    }
    return true;
  }

  void handleUpload() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        addUpdateData();
      }
    }
  }

  void toggleTab(int value) {
    _selectedSource = value;
    notifyListeners();
  }

  Future<void> addUpdateData() async {
    bool? result = await processApi(process: () async {
      var id = calendarDataInfo?.id ?? calendarRepository.getCalendarDetailId();
      return await calendarRepository.addEDitDate(englishTitle: engTitle.text,
          gujaratiTitle: gujTitle.text,
          englishDesc: engDescription.text,
          gujaratiDesc: gujDescription.text,
          id: id, calendarDate: calendarDate, calendarDataType: selectedSource == 0 ? CalendarDataType.data:CalendarDataType.video, videoUrl: videoUrl.text, isEdit: _isEdit,
      );
    }, loadingHandler: loadingDialogHandler.handleBgDialog);
    if (result ?? false) {
      if (context.mounted) {
        context.showSuccessSnackBar(message: 'Data ${_isEdit ? "Edited" : "added"} successfully');
        if (_isEdit) {
          context.navigator.pop(false);
        } else {
          context.navigator.pop(true);
        }
      }
    }
  }

  void init() {
    _isEdit = true;
    _engTitle.text =
        calendarDataInfo?.title.customTranslate(SupportedLanguage.english) ??
            '';
    _gujTitle.text =
        calendarDataInfo?.title.customTranslate(SupportedLanguage.gujarati) ??
            '';
    _gujDescription.text = calendarDataInfo?.description.customTranslate(
        SupportedLanguage.gujarati) ?? '';
    _engDescription.text = calendarDataInfo?.description.customTranslate(
        SupportedLanguage.english) ?? '';
    _videoUrl.text = CalendarDateInfoDocumentFields.videoUrl ?? '';
    notifyListeners();
  }
}

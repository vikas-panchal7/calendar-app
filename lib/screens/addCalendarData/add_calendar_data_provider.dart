part of 'add_calendar_data.dart';

class AddCalendarDataProvider extends BaseProvider {
  final CalendarDateInfo? calendarDataInfo;
  final CalendarRepository calendarRepository;
  final LoadingDialogHandler loadingDialogHandler;
  final DateTime calendarDate;

  AddCalendarDataProvider({
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
  final TextEditingController _hindiTitle = TextEditingController();
  final TextEditingController _gujDescription = TextEditingController();
  final TextEditingController _engDescription = TextEditingController();
  final TextEditingController _hindiDescription = TextEditingController();
  final TextEditingController _videoUrl = TextEditingController();
  int _selectedSource = 0;
  bool _isEdit = false;

  bool get isEdit => _isEdit;

  TextEditingController get videoUrl => _videoUrl;

  TextEditingController get gujDescription => _gujDescription;

  TextEditingController get engDescription => _engDescription;

  TextEditingController get hindiDescription => _hindiDescription;

  TextEditingController get engTitle => _engTitle;

  TextEditingController get gujTitle => _gujTitle;

  TextEditingController get hindiTitle => _hindiTitle;

  int get selectedSource => _selectedSource;

  void handleDeleteData() {
    DeleteDialog.show(
      context: context,
      type: context.l10n.data,
      onDelete: () {
        context.navigator.pop();

        _deleteData();
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
    bool? result = await processApi(
        process: () async {
          var id =
              calendarDataInfo?.id ?? calendarRepository.getCalendarDetailId();
          return await calendarRepository.addEditDate(
            englishTitle: engTitle.text,
            gujaratiTitle: gujTitle.text,
            hindiTitle: hindiTitle.text,
            englishDesc: engDescription.text,
            gujaratiDesc: gujDescription.text,
            hindiDesc: hindiDescription.text,
            createdAt: calendarDataInfo?.createdAt ?? DateTime.timestamp(),
            updatedAt: DateTime.timestamp(),
            id: id,
            calendarDate: calendarDate,
            calendarDataType: selectedSource == 0
                ? CalendarDataType.data
                : CalendarDataType.video,
            videoUrl: videoUrl.text,
            isEdit: _isEdit,
          );
        },
        loadingHandler: loadingDialogHandler.handleBgDialog);
    if (result ?? false) {
      if (context.mounted) {
        context.showSuccessSnackBar(
            message: 'Data ${_isEdit ? "Edited" : "added"} successfully');
        if (_isEdit) {
          context.navigator.pop(false);
        } else {
          context.navigator.pop(true);
        }
      }
    }
  }

  void init() {
    _selectedSource =
        calendarDataInfo?.dataType == CalendarDataType.data ? 0 : 1;
    _isEdit = true;
    _engTitle.text =
        calendarDataInfo?.title.customTranslate(SupportedLanguage.english) ??
            '';
    _gujTitle.text =
        calendarDataInfo?.title.customTranslate(SupportedLanguage.gujarati) ??
            '';
    _hindiTitle.text =
        calendarDataInfo?.title.customTranslate(SupportedLanguage.hindi) ??
            '';
    _gujDescription.text = calendarDataInfo?.description
            .customTranslate(SupportedLanguage.gujarati) ??
        '';
    _engDescription.text = calendarDataInfo?.description
            .customTranslate(SupportedLanguage.english) ??
        '';
    _hindiDescription.text = calendarDataInfo?.description
        .customTranslate(SupportedLanguage.hindi) ??
        '';
    _videoUrl.text = calendarDataInfo?.videoUrl ?? '';
    notifyListeners();
  }

  Future<void> _deleteData() async {
    bool result = await processApi(
        process: () async =>
            calendarRepository.deleteData(id: calendarDataInfo?.id ?? ''),
        loadingHandler: loadingDialogHandler.handleBgDialog);
    if (result) {
      if (context.mounted) {
        context.navigator.pop();
        context.showSuccessSnackBar(message: 'Data Deleted Successfully');
      }
    }
  }
}

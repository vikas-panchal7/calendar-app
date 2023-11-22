part of 'add_book.dart';

class AddBookProvider extends BaseProvider {
  final BookInfo? bookInfo;
  final BookRepository bookRepository;
  final LoadingDialogHandler loadingHandler;

  AddBookProvider({
    required this.bookRepository,
    required this.loadingHandler,
    required super.context,
    required this.bookInfo,
  }) {
    if (bookInfo != null) {
      init();

    }
  }

  final TextEditingController _engTitle = TextEditingController();
  final TextEditingController _gujTitle = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _showBookRequiredMsg = false;
  File? _bookFile;
  String? _selectedBookFile;
  BookFileType? _selectedFileType;
  bool _isEdit = false;

  TextEditingController get engTitle => _engTitle;

  TextEditingController get gujTitle => _gujTitle;

  String? get selectedBookFile => _selectedBookFile;

  bool get isEdit => _isEdit;

  File? get bookFile => _bookFile;

  bool get showBookRequiredMsg => _showBookRequiredMsg;

  Future<void> chooseBook() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'docx']);

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileType = file.path.split('/').last.split('.').last;
      if (fileType == 'pdf' || fileType == 'doc') {
        _selectedFileType = BookFileType.values.where((element) => element.value == fileType).first;
        _bookFile = file;
        _selectedBookFile = _bookFile?.path;
        notifyListeners();
      } else {
        if (context.mounted) {
          context.showErrorSnackBar(message: AppStrings.fileFormatNotMatch);
        }
      }
    }
  }

  void init() {
    _isEdit = true;
    _engTitle.text = bookInfo?.title.customTranslate(SupportedLanguage.english) ?? '';
    _gujTitle.text = bookInfo?.title.customTranslate(SupportedLanguage.gujarati) ?? '';
    _selectedBookFile = bookInfo?.fileUrl;
    notifyListeners();
  }

  Future<void> addUpdateBook() async {
    bool? result = await processApi(
        process: () async {
          var id = bookInfo?.id ?? bookRepository.getBookId();

          String url = await uploadFile();

          return await bookRepository.addEditBook(
              englishTitle: _engTitle.text,
              gujaratiTitle: _gujTitle.text,
              fileUrl: url,
              fileType: bookInfo?.fileType ?? _selectedFileType!,
              createdAt: bookInfo?.createdAt ?? DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              id: id,
              isEdit: _isEdit);
        },
        loadingHandler: loadingHandler.handleBgDialog);

    if (result ?? false) {
      if (context.mounted) {
        context.showSuccessSnackBar(message: 'Book ${_isEdit ? "Edited" : "added"} successfully');
        if (_isEdit) {
          context.navigator.pop(false);
        } else {
          context.navigator.pop(true);
        }
      }
    }
  }

  void viewFile() {
    context.navigator.pushNamed(CustomPdfView.routeName,
        arguments: CustomPdfViewArg(pdfPath: _selectedBookFile ?? '', title: bookInfo?.title.translate(context) ?? ''));
    // OpenFile.open(bookFile?.path);
  }

  void handleDeleteBook() {
    DeleteDialog.show(
      context: context,
      type: AppStrings.book,
      onDelete: () {
        context.navigator.pop();
        deleteBook();
      },
    );
  }

  Future<void> deleteBook() async {
    bool result = await processApi(
        process: () async => bookRepository.deleteBook(id: bookInfo?.id ?? ''),
        loadingHandler: loadingHandler.handleBgDialog);
    if (result) {
      if (context.mounted) {
        context.navigator.pop();
        context.showSuccessSnackBar(message: 'Book Deleted Successfully');
      }
    }
  }

  Future<bool> onWillPop() async {
    if (engTitle.text.isNotEmpty || gujTitle.text.isNotEmpty || bookFile != null) {
      DiscardDialog.show(context: context);
      return false;
    }
    return true;
  }

  void handleUpload() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        if (selectedBookFile != null) {
          addUpdateBook();
        } else {
          _showBookRequiredMsg = true;
          notifyListeners();
        }
      }
    }
  }

  Future<String> uploadFile() async {
    if (_bookFile != null) {
      if (_isEdit) {
        await bookRepository.deleteFileFromStorage(url: bookInfo?.fileUrl ?? '');
      }
      return await bookRepository.uploadFileToStorage(file: _bookFile!);
    } else {
      return bookInfo?.fileUrl ?? '';
    }
  }
}

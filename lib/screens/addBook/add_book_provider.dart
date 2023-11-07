part of 'add_book.dart';

class AddBookProvider extends BaseProvider {
  final AddBookArguments args;

  AddBookProvider({required super.context, required this.args});


  final GlobalKey<FormState> formKey =GlobalKey<FormState>();
  final TextEditingController _engTitle = TextEditingController();
  TextEditingController get engTitle => _engTitle;
  final TextEditingController _gujTitle = TextEditingController();
  TextEditingController get gujTitle => _gujTitle;
  File? _bookFile;
  File? get bookFile => _bookFile;
  bool _showBookRequiredMsg = false;
  bool get showBookRequiredMsg => _showBookRequiredMsg;

  Future<void> chooseBook() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileType = file.path.split('/').last.split('.').last;
      if (fileType == 'pdf' || fileType == 'doc') {
        _bookFile = file;
        notifyListeners();
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(
            context: context,
            msg: AppStrings.fileFormatNotMatch,
            type: SnackBarType.error);
      }
    }
  }

  void viewFile() {
    OpenFile.open(bookFile?.path);
  }

  void handleDeleteBook() {
    DeleteDialog.show(context: context, type: AppStrings.book, onDelete: () {
      context.navigator.pop();
      context.navigator.pop();
    },);
  }

  Future<bool> onWillPop() async{
    if(engTitle.text.isNotEmpty || gujTitle.text.isNotEmpty || bookFile != null){
DiscardDialog.show(context: context);
      return false;
    }
    return true;
  }

  void handleUpload() {
      if(formKey.currentState != null){
        if(formKey.currentState!.validate()){
          if(bookFile!=null){
context.navigator.pop();
          }else{
            _showBookRequiredMsg = true;
            notifyListeners();
          }
        }
      }
  }
}

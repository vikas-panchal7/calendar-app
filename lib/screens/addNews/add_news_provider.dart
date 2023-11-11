part of 'add_news.dart';

class AddNewsProvider extends BaseProvider {
  final AddNewsArguments args;

  AddNewsProvider({required super.context, required this.args});


  final GlobalKey<FormState> formKey =GlobalKey<FormState>();
  final TextEditingController _engTitle = TextEditingController();
  TextEditingController get engTitle => _engTitle;
  final TextEditingController _gujTitle = TextEditingController();
  TextEditingController get gujTitle => _gujTitle;
  File? _newsFile;
  File? get newsFile => _newsFile;
  bool _showBookRequiredMsg = false;
  bool get showBookRequiredMsg => _showBookRequiredMsg;

  Future<void> chooseFile() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['pdf','jpg','png','jpeg','heic','webp','gif','bmp']);

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileType = file.path.split('/').last.split('.').last;

        _newsFile = file;
        notifyListeners();

    }
  }

  void viewFile() {
    if(_newsFile?.path.split('/').last.split('.').last == 'pdf'){

    OpenFile.open(newsFile?.path);
    }else{
      context.navigator.pushNamed(ImageView.routeName,arguments: newsFile?.path);
    }
  }

  void handleDelete() {
    DeleteDialog.show(context: context, type: AppStrings.news, onDelete: () {
      context.navigator.pop();
      context.navigator.pop();
    },);
  }

  Future<bool> onWillPop() async{
    if(engTitle.text.isNotEmpty || gujTitle.text.isNotEmpty || newsFile != null){
DiscardDialog.show(context: context);
      return false;
    }
    return true;
  }

  void handleUpload() {
      if(formKey.currentState != null){
        if(formKey.currentState!.validate()){
          if(newsFile!=null){
context.navigator.pop();
          }else{
            _showBookRequiredMsg = true;
            notifyListeners();
          }
        }
      }
  }
}

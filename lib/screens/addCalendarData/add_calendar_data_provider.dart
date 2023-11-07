part of 'add_calendar_data.dart';

class AddCalendarDataProvider extends BaseProvider{
  final AddCalendarDataArguments args;
  AddCalendarDataProvider({required super.context, required this.args});

  final GlobalKey<FormState> formKey =GlobalKey<FormState>();

  final TextEditingController _engTitle = TextEditingController();
  TextEditingController get engTitle => _engTitle;
  final TextEditingController _gujTitle = TextEditingController();
  TextEditingController get gujTitle => _gujTitle;
  final TextEditingController _description = TextEditingController();
  TextEditingController get description => _description;
  String? _imagePath;
  String? get imagePath =>_imagePath;

  int _selectedSource = 0;
  int get selectedSource => _selectedSource;

  void handleDeleteBook() {
    DeleteDialog.show(context: context, type: AppStrings.data, onDelete: () {
      context.navigator.pop();
      context.navigator.pop();
    },);
  }

  Future<void> chooseImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      _imagePath = image.path;
      notifyListeners();
    }
  }

  void showImage() {
    context.navigator.pushNamed(ImageView.routeName,arguments: imagePath);
  }

  Future<bool> onWillPop() async{
    if(engTitle.text.isNotEmpty || gujTitle.text.isNotEmpty ||description.text.isNotEmpty || imagePath != null){
      DiscardDialog.show(context: context);
      return false;
    }
    return true;
  }

  void handleUpload() {

    if(formKey.currentState != null){
      if(formKey.currentState!.validate()){
        if(imagePath != null ||  description.text.isNotEmpty){

          context.navigator.pop();
        }else{
          showSnackBar(context: context, msg: AppStrings.dataIsRequired,type: SnackBarType.error);
        }
      }
    }
  }

  void toggleTab(int value) {
    _selectedSource = value;
    notifyListeners();
  }
}
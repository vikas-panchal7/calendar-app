part of 'add_calendar_data.dart';

class AddCalendarDataProvider extends BaseProvider {
  final AddCalendarDataArguments args;

  AddCalendarDataProvider({required super.context, required this.args});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _engTitle = TextEditingController();

  final TextEditingController _gujTitle = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _videoUrl = TextEditingController();
  int _selectedSource = 0;

  TextEditingController get videoUrl => _videoUrl;

  TextEditingController get description => _description;

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
    if (engTitle.text.isNotEmpty || gujTitle.text.isNotEmpty || description.text.isNotEmpty) {
      DiscardDialog.show(context: context);
      return false;
    }
    return true;
  }

  void handleUpload() {

    if(formKey.currentState != null){
      if(formKey.currentState!.validate()){

          context.navigator.pop();
      }
    }
  }

  void toggleTab(int value) {
    _selectedSource = value;
    notifyListeners();
  }
}

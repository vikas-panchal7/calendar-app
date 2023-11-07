part of 'add_video.dart';

class AddVideoProvider extends BaseProvider{
  final AddVideoArguments args;
  AddVideoProvider({required super.context, required this.args});

  final GlobalKey<FormState> formKey =GlobalKey<FormState>();
  final TextEditingController _urlText = TextEditingController();
  TextEditingController get urlText => _urlText;

  void handleUpload() {
    if(formKey.currentState != null){
      if(formKey.currentState!.validate()){
        context.navigator.pop();
      }
    }
  }

  void handleDelete() {
    DeleteDialog.show(context: context, type: AppStrings.video, onDelete: () {
      context.navigator.pop();
      context.navigator.pop();
    },);
  }
  void viewVideo(){

  }
}

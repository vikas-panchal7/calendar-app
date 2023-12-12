part of 'phone_number_and_name_dialog.dart';

class _PhoneNumberAndNameProvider extends BaseProvider{
  final String userName;
  _PhoneNumberAndNameProvider({required super.context,required this.userName});

  final GlobalKey<FormState> formKey =GlobalKey<FormState>( );

  TextEditingController nameController =  TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userProfessionController = TextEditingController();


  @override
  void initState() {

    super.initState();
    nameController.text = userName;

  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      context.navigator.pop({
        'userName' : nameController.text,
        'phoneNo': phoneController.text,
        'city':cityController.text,
        'userProfession': userProfessionController.text

      });
    }
  }
}

part of 'phone_number_and_name_dialog.dart';

class PhoneNumberAndNameDialogUI extends StatelessWidget {
  static Future open(BuildContext context, String userName) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: context.width * .05),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ChangeNotifierProvider<_PhoneNumberAndNameProvider>(
              create: (context) => _PhoneNumberAndNameProvider(
                  context: context, userName: userName),
              builder: (context, child) =>
                  Consumer<_PhoneNumberAndNameProvider>(
                      builder: (context, value, child) {
                return const PhoneNumberAndNameDialogUI();
              }),
            ));
      },
    );
  }

  const PhoneNumberAndNameDialogUI({super.key});

  @override
  Widget build(BuildContext context) {
    _PhoneNumberAndNameProvider provider =
        context.read<_PhoneNumberAndNameProvider>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: provider.nameController,
                hintText: context.l10n.username,
                title: context.l10n.username,
                suffix: const SizedBox(),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return context.l10n.fieldIsRequired;
                    }
                  }
                  return null;
                },
              ),
              const Gap(4),
              CustomTextField(
                controller: provider.phoneController,
                hintText: context.l10n.phoneNumber,
                maxLength: 10,
                keyboardType: TextInputType.number,
                title: context.l10n.phoneNumber,
                suffix: const SizedBox(),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return context.l10n.fieldIsRequired;
                    }
                    if (value.length != 10) {
                      return context.l10n.enterValidNumber;
                    }
                  }
                  return null;
                },
              ),
              const Gap(4),
              CustomTextField(
                controller: provider.userProfessionController,
                hintText: context.l10n.profession,
                title: context.l10n.profession,
                suffix: const SizedBox(),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return context.l10n.fieldIsRequired;
                    }
                  }
                  return null;
                },
              ),
              const Gap(4),
              CustomTextField(
                controller: provider.cityController,
                hintText: context.l10n.city,
                title: context.l10n.city,
                suffix: const SizedBox(),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return context.l10n.fieldIsRequired;
                    }
                  }
                  return null;
                },
              ),
              const Gap(8),
              ButtonItem.filled(
                onTap: () {
                  provider.onSubmit();
                },
                text: context.l10n.submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}

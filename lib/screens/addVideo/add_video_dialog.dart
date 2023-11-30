part of 'add_video.dart';

class AddVideoDialog extends StatelessWidget {
  static Future show({required BuildContext context, VideoInfo? videoInfo}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: context.width * .05),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ChangeNotifierProvider<AddVideoProvider>(
              create: (context) => AddVideoProvider(
                  context: context,
                  videoInfo: videoInfo,
                  videoRepository: VideoRepository(),
                  loadingHandler: LoadingDialogHandler(context: context)),
              builder: (context, child) => const AddVideoDialog(),
            ));
      },
    );
  }

  const AddVideoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddVideoProvider addVideoProvider = context.read<AddVideoProvider>();
    return Form(
      key: addVideoProvider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            width: context.width,
            decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16))),
            height: kToolbarHeight,
            child: NavigationToolbar(
                middle: Text(
                  addVideoProvider.videoInfo != null ? AppStrings.editVideo : AppStrings.addVideo,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: context.colorScheme.onSecondary, fontWeight: FontWeight.w600),
                ),
                trailing: CommonButton.cupertino(
                    onTap: () {
                      context.navigator.pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: context.colorScheme.onSecondary,
                    ))),
          ),
          const Gap(10),

          /// eng title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                /// add url field
                CustomTextField(
                  title: AppStrings.videoUrl,
                  controller: addVideoProvider.urlText,
                  hintText: AppStrings.writeHere,
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return AppStrings.fieldIsRequired;
                      }
                      if ((value.contains('youtu') == false) && (value.contains('yt') == false)) {
                        return 'Please enter valid link';
                      }
                    }
                    return null;
                  },
                ),

                /// view and delete
                Visibility(
                  visible: addVideoProvider.videoInfo != null,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonItem.outline(
                            onTap: addVideoProvider.handleDelete,
                            text: AppStrings.delete,
                            height: 45,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: ButtonItem.filled(
                            onTap: addVideoProvider.viewVideo,
                            text: 'View',
                            height: 45,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// upload video button
                ButtonItem.filled(
                  onTap: addVideoProvider.handleUpload,
                  text: AppStrings.upload,
                  height: 45,
                  fontSize: 16,
                ),
                const Gap(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

part of 'video_list.dart';

class VideoListUI extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<VideoListProvider>(
      create: (context) => VideoListProvider(context: context),
      builder: (context, child) => const VideoListUI(),
    );
  }

  const VideoListUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.videos),
        actions: [
          CommonButton.cupertino(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                AddVideoDialog.show(context: context);
              },
              child: Text(
                AppStrings.addVideo,
                style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.onBackground),
              ))
        ],
      ),
      body: ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: context.width * .04, vertical: 10),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CommonButton.cupertino(
            onTap: () {},
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: context.colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: context.colorScheme.onTertiary.withOpacity(.04),
                        blurRadius: 16,
                        offset: const Offset(0, 6))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 32),
                    child: Assets.images.video.image(height: 30),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'video title ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'http:/usbdu sdjhbn ds sd.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium
                              ?.copyWith(color: context.colorScheme.onSurface),
                        ),
                      ],
                    ),
                  ),
                  EditAndDeletePopUPMenu(
                    type: AppStrings.video,
                    onDelete: () {
                      context.navigator.pop();

                    },
                    onEdit: () {

                      AddVideoDialog.show(context: context,addVideoArguments: AddVideoArguments(forUpdate: true));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

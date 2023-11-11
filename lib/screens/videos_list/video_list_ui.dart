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
    CalendarPreference preference = CalendarPreference();
    return Scaffold(
      /*appBar: AppBar(
        title: const Text(AppStrings.videos),
        actions: [
          if (preference.isAdminLogin) ...[
            CommonButton.cupertino(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onTap: () {
                  AddVideoDialog.show(context: context);
                },
                child: Text(
                  AppStrings.addVideo,
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSecondary),
                ))
          ]
        ],
      ),*/
      floatingActionButton: FloatingActionButton(onPressed: () {
        AddVideoDialog.show(context: context);
      },
      child: Icon(Icons.add,color: context.colorScheme.onSecondary,),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(7 , 5, 7, 80),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CommonButton.cupertino(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: context.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: context.colorScheme.onTertiary.withOpacity(.04),
                        blurRadius: 16,
                        offset: const Offset(0, 6))
                  ]),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network('https://i.ytimg.com/vi/3wBEUuV7BYg/maxresdefault.jpg',width: context.width *.35)),
                  ),
                  Expanded(
                    child: Text(
                      'Deepinder Goyal - Journey From Startup To IPO, Challenges And Achievements | TRS हिंदी 210',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (preference.isAdminLogin) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: EditAndDeletePopUPMenu(

                        type: AppStrings.video,
                        onDelete: () {
                          context.navigator.pop();
                        },
                        onEdit: () {
                          AddVideoDialog.show(context: context, addVideoArguments: AddVideoArguments(forUpdate: true));
                        },
                      ),
                    )
                  ]
                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) { return const Gap(5); },
      ),
    );
  }
}

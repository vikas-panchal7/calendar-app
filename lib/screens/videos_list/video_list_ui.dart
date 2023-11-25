part of 'video_list.dart';

class VideoListUI extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<VideoListProvider>(
      create: (context) => VideoListProvider(
        context: context,
        loadingHandler: LoadingDialogHandler(context: context),
        videoRepository: VideoRepository(),
      ),
      builder: (context, child) => const VideoListUI(),
    );
  }

  const VideoListUI({super.key});

  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference.instance;
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AddVideoDialog.show(context: context);
          },
          child: Icon(
            Icons.add,
            color: context.colorScheme.onSecondary,
          ),
        ),
        body: PaginationListener(
          onLoadMore: context.read<VideoListProvider>().onLoadMore,
          onRefresh: context.read<VideoListProvider>().onReload,
          child: Builder(
            builder: (context) {
              final list = context.select<VideoListProvider, List<VideoInfo?>>((value) => value.list);
              final isLoading = context.select<VideoListProvider, bool>((value) => value.isLoading);

              if (isLoading && list.isEmpty) {
                return const LoadingIndicator();
              }

              if (list.isEmpty) {
                return const EmptyPlaceHolder();
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(7, 5, 7, 80),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        VideoInfo? videoInfo = list[index];
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
                                      child: Image.network(
                                        videoInfo?.thumbnailUrl ?? '',
                                        width: context.width * .35,
                                        height: context.width * .2,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: context.width * .35,
                                            height: context.width * .2,
                                          );
                                        },
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                    videoInfo?.videoTitle ?? '',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                if (preference.isAdminLogin) ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: CommonButton.cupertino(
                                      onTap: () => DeleteDialog.show(
                                        context: context,
                                        type: 'Video',
                                        onDelete: () {
                                          context.read<VideoListProvider>().deleteVideo(videoInfo?.id ?? '');
                                        },
                                      ),
                                      child: Icon(
                                        Icons.delete,
                                        color: context.colorScheme.primary,
                                      ),
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Gap(5);
                      },
                    ),
                  ),
                  if (isLoading) ...[const LoadingIndicator(size: 80)]
                ],
              );
            },
          ),
        ));
  }
}

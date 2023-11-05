

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
          appBar: AppBar(title: const Text(AppStrings.videos),),

    );
  }
}

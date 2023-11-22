part of 'loading_handler.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;

  const LoadingIndicator({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(_lottiePath, height: size ?? 120, width: size ?? 120),
    );
  }
}

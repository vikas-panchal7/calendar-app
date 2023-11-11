import 'package:flutter/material.dart';

typedef OnNotificationReFresh = Future Function();
typedef OnLoadMore = Future Function();

class PaginationListener extends StatefulWidget {
  final Widget child;
  final OnNotificationReFresh onRefresh;
  final OnLoadMore onLoadMore;

  const PaginationListener(
      {super.key,
      required this.child,
      required this.onRefresh,
      required this.onLoadMore});

  @override
  State<PaginationListener> createState() => _PaginationListenerState();
}

class _PaginationListenerState extends State<PaginationListener> {
  @override
  Widget build(BuildContext context) {
    Widget child = NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.maxScrollExtent <=
              notification.metrics.pixels) {
            widget.onLoadMore();
          }
          return true;
        },
        child: RefreshIndicator.adaptive(
            onRefresh: widget.onRefresh, child: widget.child));

    return child;
  }
}

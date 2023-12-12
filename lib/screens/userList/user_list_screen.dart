part of 'user_list.dart';

class UserListScreenUI extends StatelessWidget {
  static const String routeName = '/userList';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<UserListProvider>(
      create: (context) => UserListProvider(
          context: context,
          loadingHandler: LoadingDialogHandler(context: context),
          userRepository: UserRepository()),
      builder: (context, child) {
        return const UserListScreenUI();
      },
    );
  }

  const UserListScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(context.l10n.userList)),
        body: PaginationListener(
          onLoadMore: context.read<UserListProvider>().onLoadMore,
          onRefresh: context.read<UserListProvider>().onReload,
          child: Builder(
            builder: (context) {
              final list =
                  context.select<UserListProvider, List<UserDataInfo?>>(
                      (value) => value.list);
              final isLoading = context
                  .select<UserListProvider, bool>((value) => value.isLoading);

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
                      padding: const EdgeInsets.all(10),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        UserDataInfo? userDataInfo = list[index];
                        return Container(
                          // height: 80,
                          padding: const EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                              color: context.colorScheme.onBackground,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colorScheme.secondary
                                      .withOpacity(.09),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                )
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 32),
                                child: Image.network(
                                  userDataInfo?.imageUrl ?? '',
                                  height: 50,
                                  width: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: context.colorScheme.primary,
                                          shape: BoxShape.circle),
                                      height: 50,
                                      width: 50,
                                      child: Icon(Icons.person,color: context.colorScheme.onBackground),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userDataInfo?.userName ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      userDataInfo?.gmail ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.titleSmall,
                                    ),
                                    Text(
                                      userDataInfo?.phoneNo ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.titleSmall,
                                    ),
                                    Text(
                                      userDataInfo?.userProfession ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.titleSmall,
                                    ),
                                    Text(
                                      userDataInfo?.city ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

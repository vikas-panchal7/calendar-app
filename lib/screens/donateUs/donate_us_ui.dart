part of 'donate_us.dart';
class DonateUsScreenUI extends StatelessWidget {
  static const String routeName = '/donateUs';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DonateUsProvider>(
      create: (context) {
        return DonateUsProvider(
          context: context,
        );
      },
      builder: (context, child) {
        return const DonateUsScreenUI();
      },
    );
  }
  const DonateUsScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(context.l10n.donateUs)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(context.height * 0.07),
          /// qr code image

          // Assets.temp.qrCode.image(width: context.width *0.7),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                /// share qr
                Expanded(
                  child: CommonButton.cupertino(onTap: () {

                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share,color: context.colorScheme.primary,size: 18,),
                      const Gap(8),
                      Text(context.l10n.shareQr,style:  context.textTheme.titleSmall?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w600),)
                    ],
                  )),
                ),
                SizedBox(
                    height: 20,
                    child: VerticalDivider(color: context.colorScheme.primary.withOpacity(0.2),)),
                /// download qr
                Expanded(
                  child: CommonButton.cupertino(onTap: () {

                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download_for_offline_sharp,color: context.colorScheme.primary,size: 18,),
                      const Gap(8),
                      Text(context.l10n.downloadQr,style:  context.textTheme.titleSmall?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w600),)
                    ],
                  )),
                )
              ],
            ),
          ),
          Divider(color: context.colorScheme.primary.withOpacity(0.2),height: 0,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('xyz@ybl',style:  context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onBackground,),),
                Icon(Icons.copy,color: context.colorScheme.primary,)
              ],
            ),
          ),
          Divider(color: context.colorScheme.primary.withOpacity(0.2),height: 0,),


        ],
      ),
    );
  }
}


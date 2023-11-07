part of 'add_calendar_data.dart';

class AddCalendarDataScreenUI extends StatelessWidget {
  static const routeName = '/addCalendarData';

  static Widget builder(BuildContext context) {
    AddCalendarDataArguments? args = context.args as AddCalendarDataArguments?;
    return ChangeNotifierProvider<AddCalendarDataProvider>(
      create: (context) => AddCalendarDataProvider(context: context,args:args??AddCalendarDataArguments()),
      builder: (context, child) => const AddCalendarDataScreenUI(),
    );
  }

  const AddCalendarDataScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    AddCalendarDataProvider addCalendarDataProvider = context.read<AddCalendarDataProvider>();
    return WillPopScope(
      onWillPop: addCalendarDataProvider.onWillPop,

      child: Form(
        key: addCalendarDataProvider.formKey,
        child: Scaffold(
          appBar: AppBar(
            title:  Text(addCalendarDataProvider.args.forUpdate? AppStrings.editData:AppStrings.addData),
            actions: [
              if(addCalendarDataProvider.args.forUpdate)
                CommonButton.icon(onTap: addCalendarDataProvider.handleDeleteBook, child: Icon(Icons.delete,color: context.colorScheme.onBackground,))
            ],
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(context.width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.title,
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary),
                  ),
                  Gap(context.height * .01),

                  /// eng title
                  CustomTextField(
                    title: AppStrings.inEnglish,
                    controller: addCalendarDataProvider.engTitle,
                    hintText: AppStrings.writeHere,
                    validator: (value) {
                      if (value != null) {
                        if(value.isEmpty){
                          return AppStrings.fieldIsRequired;
                        }
                      }
                      return null;
                    },
                  ),
                  const Gap(10),

                  /// guj title
                  CustomTextField(
                    title: AppStrings.inGujarati,
                    controller: addCalendarDataProvider.gujTitle,
                    hintText: AppStrings.writeHere,
                    validator: (value) {
                      if (value != null) {
                        if(value.isEmpty){
                          return AppStrings.fieldIsRequired;
                        }
                      }
                      return null;
                    },
                  ),

                  const Gap(24),
                  Text(
                    AppStrings.data,
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary),
                  ),
                  Gap(context.height * .01),


                   Selector<AddCalendarDataProvider,int>( selector: (context, addCalendarDataProvider) => addCalendarDataProvider.selectedSource,

                   builder: (context, selectedSource, child) {
                     return Column(
                       children: [
                     CustomTabBar(
                     width: context.width-40 ,
                       tabList: const [AppStrings.description,AppStrings.addImage],
                       onSelect: addCalendarDataProvider.toggleTab ,
                       selectedTab: selectedSource,

                     ),
                         if(selectedSource ==0)...{
                           /// Desc
                           CustomTextField(
                             title: AppStrings.description,
                             controller: addCalendarDataProvider.description,
                             hintText: AppStrings.writeHere,

                           ),
                         }else...{
                           /// select image option

                           _SelectImageWidget()
                         }
                       ],
                     );
                   },
                   ),




                ],
              )
          ),
          /// upload button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonItem.filled(

                onTap:addCalendarDataProvider.handleUpload, text: AppStrings.upload),
          ),
        ),
      ),
    );
  }
}




class _SelectImageWidget extends StatelessWidget {
  const _SelectImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddCalendarDataProvider addCalendarDataProvider = context.read<AddCalendarDataProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.addImage,
          style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colorScheme.primary),
        ),
        const Gap(8),
        Selector<AddCalendarDataProvider,String?>(
          selector: (context, addBookProvider) => addBookProvider.imagePath,
          builder: (context, imagePath, child) {
            if(imagePath == null){
              return CommonButton.material(
                  onTap: addCalendarDataProvider.chooseImage,
                  radius: 12,
                  child: Container(
                    alignment: Alignment.center,

                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: context.colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: context.colorScheme.surface)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: context.colorScheme.primary,
                        ),
                        const Gap(5),
                        Text(
                          AppStrings.addImage,
                          style: context.textTheme.bodyLarge?.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ));
            }else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(imagePath,style: context.textTheme.labelSmall,),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonItem.outline(

                            onTap: addCalendarDataProvider.showImage, text: 'View',height: 45,fontSize: 16),
                      ),
                      Gap(context.width * .04),
                      Expanded(
                        child: ButtonItem.filled(

                            onTap: addCalendarDataProvider.chooseImage, text: 'Change',height: 45,fontSize: 16),
                      )

                    ],
                  )
                ],
              );
            }
          },
        )


      ],
    );
  }
}

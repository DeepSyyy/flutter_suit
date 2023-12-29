import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_media/core/errors/failure.dart';
import 'package:suit_media/feature/third_screen/business/entity/main_entity.dart';
import 'package:suit_media/feature/third_screen/presentation/provider/third_screen_provider.dart';
import 'package:suit_media/feature/third_screen/presentation/widget/suitmedia_container_user.dart';

class SuitmediaThirdPageWidget extends StatefulWidget {
  const SuitmediaThirdPageWidget({super.key});

  @override
  State<SuitmediaThirdPageWidget> createState() =>
      _SuitmediaThirdPageWidgetState();
}

class _SuitmediaThirdPageWidgetState extends State<SuitmediaThirdPageWidget> {
  void initState() {
    super.initState();
    String pageTotal = "1";
    Provider.of<ThirdScreenProvider>(context, listen: false)
        .eitherFailureOrDataEntity(pageTotal: pageTotal);
  }

  @override
  Widget build(BuildContext context) {
    DataEntity? dataEntity =
        Provider.of<ThirdScreenProvider>(context).dataEntities;
    Failure? failure = Provider.of<ThirdScreenProvider>(context).failure;
    if (dataEntity != null) {
      return Scaffold(
        body: ListView.builder(
            itemCount: dataEntity.data.length,
            itemBuilder: (context, index) {
              print("ini index ke $index");
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SuitmediaContainerUser(
                  imageUrl: dataEntity.data[index].avatar,
                  name:
                      "${dataEntity.data[index].firstName} ${dataEntity.data[index].lastName}",
                  email: dataEntity.data[index].email,
                ),
              );
            }),
      );
    } else if (failure != null) {
      return Scaffold(
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

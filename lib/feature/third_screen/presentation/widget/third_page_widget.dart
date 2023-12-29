import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:suit_media/core/errors/failure.dart';
import 'package:suit_media/feature/third_screen/business/entity/main_entity.dart';
import 'package:suit_media/feature/third_screen/business/entity/sub_entity.dart';
import 'package:suit_media/feature/third_screen/data/datasource/user_remote_data_source.dart';
import 'package:suit_media/feature/third_screen/presentation/provider/third_screen_provider.dart';
import 'package:suit_media/feature/third_screen/presentation/widget/suitmedia_container_user.dart';

class SuitmediaThirdPageWidget extends StatefulWidget {
  const SuitmediaThirdPageWidget({super.key});

  @override
  State<SuitmediaThirdPageWidget> createState() =>
      _SuitmediaThirdPageWidgetState();
}

class _SuitmediaThirdPageWidgetState extends State<SuitmediaThirdPageWidget> {
  final PagingController<int, UserEntity> _pagingController =
      PagingController(firstPageKey: 1);
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchApi(pageKey);
    });
    int pageTotal = 1;
    Provider.of<ThirdScreenProvider>(context, listen: false)
        .eitherFailureOrDataEntity(pageTotal: pageTotal);
    _pagingController.refresh();
  }

  Future<void> _fetchApi(int pageKey) async {
    try {
      final newItems = await UserRemoteDataSourceImpl(dio: Dio()).getUser(
        pageTotal: pageKey,
      );

      final isLastPage = newItems.data.isEmpty;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    DataEntity? dataEntity =
        Provider.of<ThirdScreenProvider>(context).dataEntities;
    Failure? failure = Provider.of<ThirdScreenProvider>(context).failure;
    if (dataEntity != null) {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // Trigger refresh when pulled down
            return _pagingController.refresh();
          },
          child: PagedListView<int, UserEntity>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<UserEntity>(
                itemBuilder: (context, item, index) {
              return SuitmediaContainerUser(
                imageUrl: item.avatar,
                name: "${item.firstName} ${item.lastName}",
                email: item.email,
              );
            }),
          ),
        ),
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

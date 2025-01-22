/*
 * @Author: wurangkun
 * @Date: 2024-12-17 11:22:11
 * @LastEditTime: 2025-01-22 13:08:22
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\views\home\logic.dart
 * @Description: 
 */
import 'package:flutter_chat/base/controller/controller.dart';
import 'package:flutter_chat/base/controller/list_controller.dart';
import 'package:flutter_chat/providers/im/conversation.dart';
import 'package:flutter_chat/providers/im/im.dart';
import 'package:flutter_chat/widgets/loading_wdget.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';

class HomeLogic extends BaseListController {
  ImConversation conversation = ImConversation();
  final ImController imController = Get.find<ImController>();

  @override
  void onInit() {
    super.onInit();
    // netState = NetState.dataSussessState;
  }

  @override
  void initData() {
    getnetworkdata({});
    conversation.listenerConversationList(
      onConversationChanged: (conversationList) {
        conversation.nextSeq = '0';
        conversation.isFinished = false;
        getnetworkdata({});
      },
    );
  }

  @override
  void getnetworkdata(Map<String, dynamic>? info) {
    super.getnetworkdata(info);

    /// 展示loading
    conversation
        .getConversationList()
        .then((value) {
          netState = NetState.dataSussessState;

          if (conversation.nextSeq == '0') {
          } else {}

          /// 释放下拉控件
          refreshController.refreshCompleted();

          /// 释放上拉控件
          refreshController.loadComplete();

          /// 判断数组为空,如果为空显示空视图
          if (value?.conversationList?.isEmpty == true) {
            netState = NetState.emptyDataState;
          }

          /// 判断是否可以上拉加载,一页20条,如果本页数据不足20条,说明下面没数据了.
          if ((value?.conversationList?.length ?? 0) < 100) {
            refreshController.loadNoData();
          }

          update();
          // Error: type 'AppException' is not a subtype of type 'DioException'
        })
        .catchError((onError) {
          /// 结束loading
          Loading.dissmiss();
          netState = NetState.errorshowRelesh;
          if (page == 1) {
            refreshController.refreshFailed();
          } else {
            refreshController.loadFailed();
          }
          update();
        });
  }

  // void initData() async {
  //   print('in initData');
  //   getList();
  //   conversation.listenerConversationList(
  //     onConversationChanged: (conversationList) {
  //       getList();
  //     },
  //   );
  // }

  @override
  void loadMore() {
    getnetworkdata({});
  }

  @override
  void onHidden() {}

  @override
  void refreshData() {
    conversation.nextSeq = '0';
    conversation.isFinished = false;
    getnetworkdata({});
  }

  void refreshDataV2() {
    conversation.nextSeq = '0';
    conversation.isFinished = false;
    getnetworkdata({});
  }

  pinConversation(V2TimConversation _conversation) {
    _conversation.isPinned = _conversation.isPinned == true ? false : true;
    update();
    conversation.pinConversation(_conversation);
  }
}

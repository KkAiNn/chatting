import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> checkPermission(Permission permission) async {
    Map<Permission, PermissionStatus> statuses = await [permission].request();
    print(statuses[permission]);
    PermissionStatus? status = statuses[permission];
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status?.isPermanentlyDenied == true) {
      showCupertinoDialog(
          context: Get.context!,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('权限申请'),
              content: const Text('请到您的手机设置打开相应的权限'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // 打开手机上该app权限的页面
                    openAppSettings();
                  },
                ),
              ],
            );
          });

      return false;
    } else {
      return false;
    }
  }

  static Future<bool> checkPermissions(List<Permission> permission) async {
    Map<Permission, PermissionStatus> statuses = await permission.request();
    print(statuses[Permission.location]);
    return true;
  }
}

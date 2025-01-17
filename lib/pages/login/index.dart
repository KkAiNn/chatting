/*
 * @Author: wurangkun
 * @Date: 2025-01-16 13:48:52
 * @LastEditTime: 2025-01-17 17:08:08
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\login\index.dart
 * @Description: 
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat/base/form/text_filed/text_filed.dart';
import 'package:flutter_chat/base/view/common_view.dart';
import 'package:flutter_chat/constants/colors.dart';
import 'package:flutter_chat/constants/gap.dart';
import 'package:flutter_chat/pages/login/logic.dart';
import 'package:flutter_chat/splash/logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends BaseCommonView<LoginLogic> {
  Login({super.key});
  final logic = Get.find<LoginLogic>();
  final appLogic = Get.find<AppLogic>();
  @override
  bool? get isHiddenNav => true;

  @override
  double get statusBarH => super.statusBarH;

  @override
  Widget buildContent() {
    return creatCommonView(
      logic,
      (con) => SingleChildScrollView(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Gaps.vGap60,
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 343.w,
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, .6),
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 34.w,
                          height: 34.w,
                        ),
                      ),
                      Gaps.vGap24,
                      Center(
                        child: SizedBox(
                          height: 84.h,
                          child: Text(
                            '登录',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Gaps.vGap12,
                      Center(
                        child: SizedBox(
                          child: Text(
                            '输入您的电子邮件和密码以登录。',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colours.text_gray,
                            ),
                          ),
                        ),
                      ),
                      Gaps.vGap24,
                      MyTextFiled(
                        hintText: '请输入邮箱',
                        controller: logic.emailController,
                      ),
                      Gaps.vGap12,
                      MyTextFiled(
                        keyboardType: TextInputType.visiblePassword,
                        hintText: '密码',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Login1 extends StatelessWidget {
//   final void Function(UserVo user)? onTap;
//   const Login1({super.key, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final UserVo user = UserVo(token: '123456', userName: 'wurangkun');
//     void onTapUser() {
//       print('onTapUser');
//     }

//     String? validateEmail(String? value) {
//       final RegExp emailRegex = RegExp(
//         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
//       );
//       if (value != null && !emailRegex.hasMatch(value)) {
//         return '请输入有效的电子邮件地址';
//       }
//       return null;
//     }

//     final TextEditingController emailController = TextEditingController();

//     return Scaffold(
//       body: Container(
//         width: 1.sw,
//         height: 1.sh,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/login_bg.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: SafeArea(
//             top: true,
//             bottom: false,
//             child: Column(
//               children: [
//                 Gaps.vGap60,
//                 BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                   child: Container(
//                     width: 343.w,
//                     padding: EdgeInsets.all(24.r),
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(255, 255, 255, .6),
//                       border: Border.all(width: 1, color: Colors.white),
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: Column(
//                       children: [
//                         Center(
//                           child: Image.asset(
//                             'assets/images/logo.png',
//                             width: 34.w,
//                             height: 34.w,
//                           ),
//                         ),
//                         Gaps.vGap24,
//                         Center(
//                           child: SizedBox(
//                             height: 84.h,
//                             child: Text(
//                               '登录',
//                               style: TextStyle(
//                                 fontSize: 32.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Gaps.vGap12,
//                         Center(
//                           child: SizedBox(
//                             child: Text(
//                               '输入您的电子邮件和密码以登录。',
//                               style: TextStyle(
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colours.text_gray,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Gaps.vGap24,
//                         Obx((_) => Text('${emailController.text}')),
//                         MyTextFiled(
//                           hintText: '请输入邮箱',
//                           controller: emailController,
//                         ),
//                         Gaps.vGap12,
//                         MyTextFiled(
//                           keyboardType: TextInputType.visiblePassword,
//                           hintText: '密码',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

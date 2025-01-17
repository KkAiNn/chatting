import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTextFiled extends StatefulWidget {
  /// 输入框的默认值
  final String? initialValue;

  /// 输入框的提示文字
  final String? hintText;

  /// 输入框的类型
  final TextInputType? keyboardType;

  /// 光标颜色
  final Color? cursorColor;

  /// 输入框的背景色
  final Color? fillColor;

  final double fontSize;

  /// 输入验证
  final String? Function(String?)? validator;

  /// 是否换行，默认为1行 ，为2行时，高度为2行
  final int? maxLines;

  final TextEditingController? controller;

  final Widget? suffixIcon;

  final bool? showSuffix;

  final Widget? prefixIcon;

  final bool? showPrefix;

  final FocusNode? focusNode;

  final void Function(String)? onChanged;

  const MyTextFiled({
    super.key,
    this.fontSize = 16,
    this.validator,
    this.cursorColor,
    this.initialValue,
    this.keyboardType,
    this.hintText,
    this.fillColor,
    this.maxLines = 1,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.showSuffix,
    this.showPrefix,
    this.onChanged,
    this.focusNode,
  });

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  late String inputText;
  @override
  void initState() {
    super.initState();
    inputText = '';
    if (widget.initialValue != null) {
      inputText = widget.initialValue!;
    }
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      inputText = widget.controller!.text;
    }
    setState(() {});
  }

  Widget? buildSuffix() {
    if (inputText.isEmpty) {
      return SizedBox();
    }
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: SizedBox(
        width: 20.w,
        child: Row(
          children: [
            GestureDetector(
              onTap: clearControllerText,
              child: Icon(Icons.cancel, color: Colors.grey, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget? buildPrefix() {
    if (widget.prefixIcon == null) {
      return SizedBox(width: 6.w);
    }
    return Padding(
      padding: EdgeInsets.only(left: 6.w),
      child: widget.prefixIcon,
    );
  }

  clearControllerText() {
    inputText = '';
    if (widget.controller != null) {
      widget.controller!.clear();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: 1,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialValue,
      onChanged: (value) {
        print(value);
        inputText = value;
        if (widget.onChanged != null) widget.onChanged!(value);
        setState(() {});
      },
      // forceErrorText: '输入的电子邮件地址无效',
      validator: widget.validator,
      cursorColor: widget.cursorColor,
      style: TextStyle(color: Colors.black, fontSize: widget.fontSize.sp),
      decoration: InputDecoration(
        isCollapsed: true,
        prefixIcon: buildPrefix(),
        prefixIconConstraints: BoxConstraints(),
        suffixIcon: buildSuffix(),
        suffixIconConstraints: BoxConstraints(),
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          borderSide: BorderSide(
            color: Colors.grey, // 未聚焦时的边框颜色
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          gapPadding: 8,
          borderSide: BorderSide(
            color: Colors.blue.shade200, // 聚焦时的边框颜色
            width: 2,
          ),
        ),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
        border: OutlineInputBorder(),
      ),
    );
  }
}

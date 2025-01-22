/*
 * @Author: wurangkun
 * @Date: 2025-01-21 14:03:17
 * @LastEditTime: 2025-01-22 13:58:42
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\enum\im.dart
 * @Description: 
 */
// enum LogLevelEnum {
//   /// 无日志
//   V2TIM_LOG_NONE('0', 0),

//   /// 全量日志
//   V2TIM_LOG_ALL('2', 2),

//   /// 输出 DEBUG，INFO，WARNING，ERROR 级别的 log
//   V2TIM_LOG_DEBUG('3', 3),

//   /// 输出 INFO，WARNING，ERROR 级别的 log
//   V2TIM_LOG_INFO('4', 4),

//   /// 	输出 WARNING，ERROR 级别的 log
//   V2TIM_LOG_WARN('5', 5),

//   /// 输出 ERROR 级别的 log
//   V2TIM_LOG_ERROR('6', 6);

//   final String value;
//   final int number;
//   const LogLevelEnum(this.value, this.number);
// }

enum ImConnectionStatus {
  /// 连接中
  V2TIM_CONN_STATUS_CONNECTING,

  /// 连接成功
  V2TIM_CONN_STATUS_CONNECTED,

  /// 连接断开
  V2TIM_CONN_STATUS_DISCONNECTED,

  /// 连接断开，且 SDK 无法自动连接，需要开发者自行重连
  V2TIM_CONN_STATUS_INVALID,
}

///1:文本消息
///
///2:自定义消息
///
///3:图片消息
///
///4:语音消息
///
///5:视频消息
///
///6:文件消息
///
///7:地理位置消息
///
///8:表情消息
///
///9:群 Tips 消息
///
///10:合并消息
enum ImElemType {
  text(1),
  custom(2),
  image(3),
  sound(4),
  video(5),
  file(6),
  location(7),
  face(8),
  groupTips(9),
  merge(10);

  final int value;
  const ImElemType(this.value);
}

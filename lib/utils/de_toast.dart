import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeToast{
  static void showToast({required String msg}){
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: DeColors.brand,
      fontSize: 14,
      fontAsset: 'assets/fonts/Pretendard-Medium.ttf',
      gravity: ToastGravity.TOP,
    );
  }
}
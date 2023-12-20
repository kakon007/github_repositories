import 'package:bs23_flutter_task_101/service/responsive_ui/responsive_flutter.dart';

mixin Mixin {
  getW(context) {
    return ResponsiveFlutter.of(context).wp(100);
  }

  getH(context) {
    return ResponsiveFlutter.of(context).hp(100);
  }

  getWP(context, p) {
    return ResponsiveFlutter.of(context).wp(p);
  }

  getHP(context, p) {
    return ResponsiveFlutter.of(context).hp(p);
  }

  // openUrl(context, url) async {
  //   // if (await canLaunchUrl(Uri.parse(url))) {
  //   await launch(url);
  //   // } else {
  //   //   EasyLoading.showError('Could not launch $url');
  //   // }
  // }
}

import 'package:bs23_flutter_task_101/service/responsive_ui/responsive_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

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

  openUrl(context, url) async {
    EasyLoading.show(status: 'Launching $url');
    if (await canLaunchUrl(Uri.parse(url))) {
      EasyLoading.dismiss();
      await launchUrl(Uri.parse(url));
    } else {
      EasyLoading.showError('Could not launch $url');
    }
  }
}

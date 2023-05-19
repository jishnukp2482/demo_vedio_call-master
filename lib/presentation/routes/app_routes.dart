import 'package:demo_vedio_call/presentation/bindings/DocumentControllerBinding.dart';
import 'package:demo_vedio_call/presentation/pages/SignUp.dart';
import 'package:demo_vedio_call/presentation/pages/UploadDocuments.dart';
import 'package:demo_vedio_call/presentation/pages/dashboard.dart';
import 'package:demo_vedio_call/presentation/pages/index.dart';
import 'package:demo_vedio_call/presentation/pages/video_call.dart';
import 'package:demo_vedio_call/presentation/widgets/imageview.dart';
import 'package:demo_vedio_call/presentation/pages/signin.dart';
import 'package:demo_vedio_call/presentation/routes/app_Pages.dart';
import 'package:demo_vedio_call/presentation/widgets/DocumentView.dart';
import 'package:get/get.dart';

import '../bindings/CallControllerBinding.dart';
import '../bindings/HomeBinding.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: AppPages.signin, page: () => SignIn()),
    GetPage(name: AppPages.signup, page: () => Signup()),
    GetPage(
        name: AppPages.dashboard,
        page: () => DashBoard(),
        binding: HomeBinding()),
    GetPage(
      name: AppPages.uploadDocuments,
      page: () => UploadDocuments(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: AppPages.documentView,
      page: () => DocumentView(),
      binding: DocumentBinding(),
    ),
    GetPage(name: AppPages.index, page:()=>IndexPage()),
    GetPage(name: AppPages.videocall, page: ()=>VideoCall(),binding: CallControllerBinding()),
    
  ];
}

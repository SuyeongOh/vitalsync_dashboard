import 'package:flutter/material.dart';
import 'package:vitalsync_dashboard/ui/page/page_home.dart';
import 'package:vitalsync_dashboard/ui/page/page_login.dart';
import 'package:vitalsync_dashboard/ui/page/page_userlist.dart';
import 'package:vitalsync_dashboard/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase 초기화
  runApp(const VitalSyncDashBoard());
}

class VitalSyncDashBoard extends StatelessWidget {
  const VitalSyncDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vital Sync Dashboard',
      debugShowCheckedModeBanner: false,
      initialRoute: AuthService().isLoggedIn() ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/user/list': (context) => UserListPage(),
      },
    );
  }
}

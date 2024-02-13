import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポートします。Import Flutter material design widgets.
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodの状態管理パッケージをインポートします。Import the Riverpod state management package.
import 'views/home_screen.dart'; // ホーム画面のウィジェットをインポートします。Import the home screen widget.
import 'views/profile_screen.dart'; // プロフィール画面のウィジェットをインポートします。Import the profile screen widget.

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);
 // AppクラスはConsumerWidgetを継承しています。The App class extends ConsumerWidget.
  @override
  Widget build(BuildContext context, WidgetRef ref) { // ウィジェットのビルドメソッド。Widget build method.
    return MaterialApp(
      title: 'Flutter Firebase Riverpod MVVM App', // アプリのタイトルを設定します。Set the app title.
      theme: ThemeData(
        primarySwatch: Colors.blue, // プライマリカラーを青に設定します。Set the primary color to blue.
        visualDensity: VisualDensity.adaptivePlatformDensity, // ビジュアル密度を適応型に設定します。Set the visual density to adaptive.
      ),
      home: const HomeScreen(), // ホーム画面を設定します。Set the home screen.
      routes: {
        '/profile': (context) => const ProfileScreen(), // プロフィール画面へのルートを設定します。Set the route to the profile screen.
      },
    );
  }
}

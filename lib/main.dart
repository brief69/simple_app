import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポートします。Import Flutter material design widgets.
import 'package:flutter_firebase_riverpod_mvvm_app/app.dart'; // アプリのメインウィジェットをインポートします。Import the app's main widget.
import 'package:firebase_core/firebase_core.dart'; // Firebaseのコア機能をインポートします。Import Firebase core functionalities.
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodの状態管理パッケージをインポートします。Import the Riverpod state management package.

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutterのウィジェットを初期化します。Initialize Flutter widgets.
  await Firebase.initializeApp(); // Firebaseを初期化します。Initialize Firebase.
  runApp(
    const ProviderScope(
      child: MyApp(), // MyAppウィジェットを実行します。Run the MyApp widget.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Riverpod MVVM App', // アプリのタイトルを設定します。Set the app title.
      theme: ThemeData(
        primarySwatch: Colors.blue, // プライマリカラーを青に設定します。Set the primary color to blue.
        visualDensity: VisualDensity.adaptivePlatformDensity, // ビジュアル密度を適応型に設定します。Set the visual density to adaptive.
      ),
      home: const App(), // Appウィジェットをホーム画面として設定します。Set the App widget as the home screen.
    );
  }
}

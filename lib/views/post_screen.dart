import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポートします。Import Flutter material design widgets.
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodの状態管理パッケージをインポートします。Import the Riverpod state management package.
import 'package:flutter_firebase_riverpod_mvvm_app/models/post_model.dart'; // Postモデルをインポートします。Import the Post model.
import 'package:flutter_firebase_riverpod_mvvm_app/view_models/post_view_model.dart'; // PostViewModelをインポートします。Import the PostViewModel.

class PostScreen extends ConsumerWidget { // PostScreenはConsumerWidgetを継承しています。PostScreen extends ConsumerWidget.
  final TextEditingController _contentController = TextEditingController();

  PostScreen({Key? key}) : super(key: key); // テキスト入力を管理するためのコントローラーを作成します。Create a controller for text input.

  @override
  Widget build(BuildContext context, WidgetRef ref) { // ウィジェットのビルドメソッド。Widget build method.
    final postViewModel = ref.read(postViewModelProvider); // PostViewModelを読み込みます。Read the PostViewModel.

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'), // アプリバーのタイトルを設定します。Set the app bar title.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // パディングを設定します。Set the padding.
        child: Column(
          children: [
            TextField(
              controller: _contentController, // テキストフィールドにコントローラーを設定します。Set the controller for the text field.
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind?', // ヒントテキストを設定します。Set the hint text.
                border: OutlineInputBorder(), // 境界線を設定します。Set the border.
              ),
              maxLines: null, // 最大行数を無制限にします。Set max lines to unlimited.
            ),
            const SizedBox(height: 20), // 高さ20の空白を追加します。Add a space with height 20.
            ElevatedButton(
              onPressed: () async {
                if (_contentController.text.isNotEmpty) { // テキストフィールドが空でない場合。If the text field is not empty.
                  final newPost = Post(
                    id: DateTime.now().millisecondsSinceEpoch.toString(), // 投稿IDを設定します。Set the post ID.
                    userId: 'testUserId', // これは認証ロジックからの実際のユーザーIDに置き換えるべきです。This should be replaced with the actual user ID from your authentication logic.
                    content: _contentController.text, // テキストフィールドの内容を投稿内容として設定します。Set the text field content as the post content.
                    createdAt: DateTime.now(), // 投稿の作成日時を設定します。Set the post creation date and time.
                  );
                  await postViewModel.addPost(newPost); // 新しい投稿を追加します。Add the new post.
                  Navigator.pop(context); // 前の画面に戻ります。Return to the previous screen.
                }
              },
              child: const Text('Post'), // ボタンのテキストを設定します。Set the button text.
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポートします。Import Flutter material design widgets.
import 'package:flutter_firebase_riverpod_mvvm_app/models/post_model.dart'; // Postモデルをインポートします。Import the Post model.
import 'package:intl/intl.dart'; // 日付フォーマットのためのintlパッケージをインポートします。Import the intl package for date formatting.

class PostWidget extends StatelessWidget { // PostWidgetはStatelessWidgetを継承しています。PostWidget extends StatelessWidget.
  final Post post; // Postオブジェクトを保持する変数。Variable to hold the Post object.

  const PostWidget({Key? key, required this.post}) : super(key: key); // コンストラクタ。Constructor.

  @override
  Widget build(BuildContext context) { // ウィジェットのビルドメソッド。Widget build method.
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // カードのマージンを設定します。Set the card's margin.
      child: Padding(
        padding: const EdgeInsets.all(16.0), // パディングを設定します。Set the padding.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 子ウィジェットを左寄せにします。Align children to the start.
          children: [
            Text(
              post.content, // 投稿の内容を表示します。Display the post content.
              style: const TextStyle(fontSize: 16.0), // テキストスタイルを設定します。Set the text style.
            ),
            const SizedBox(height: 10), // 高さ10の空白を追加します。Add a space with height 10.
            Text(
              DateFormat('yyyy/MM/dd HH:mm').format(post.createdAt), // 投稿の作成日時をフォーマットして表示します。Format and display the post creation date and time.
              style: const TextStyle(fontSize: 12.0, color: Colors.grey), // テキストスタイルを設定します。Set the text style.
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポートします。Import Flutter material design widgets.
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodの状態管理パッケージをインポートします。Import the Riverpod state management package.
import '../models/post_model.dart'; // Postモデルをインポートします。Import the Post model.
import '../view_models/post_view_model.dart'; // PostViewModelをインポートします。Import the PostViewModel.
import '../widgets/post_widget.dart'; // PostWidgetをインポートします。Import the PostWidget.

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
 // ProfileScreenはConsumerWidgetを継承しています。ProfileScreen extends ConsumerWidget.
  @override
  Widget build(BuildContext context, WidgetRef ref) { // ウィジェットのビルドメソッド。Widget build method.
    final postViewModel = ref.watch(postViewModelProvider); // PostViewModelを監視します。Watch the PostViewModel.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), // アプリバーのタイトルを設定します。Set the app bar title.
      ),
      body: FutureBuilder<List<Post>>(
        future: postViewModel.fetchUserPosts('userId'), // 'userId'を実際のユーザーIDに置き換えます。Replace 'userId' with the actual user ID.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) { // データの読み込み中。While data is loading.
            return const Center(child: CircularProgressIndicator()); // ローディングインジケータを表示します。Display a loading indicator.
          } else if (snapshot.hasError) { // エラーが発生した場合。If an error occurs.
            return Center(child: Text('Error: ${snapshot.error}')); // エラーメッセージを表示します。Display the error message.
          } else if (snapshot.hasData) { // データが存在する場合。If data is present.
            final posts = snapshot.data!; // データを取得します。Retrieve the data.
            return ListView.builder(
              itemCount: posts.length, // 投稿の数を設定します。Set the number of posts.
              itemBuilder: (context, index) { // リストアイテムのビルダー。List item builder.
                final post = posts[index]; // 投稿を取得します。Retrieve the post.
                return PostWidget(post: post); // PostWidgetを表示します。Display the PostWidget.
              },
            );
          } else { // データが見つからない場合。If no data is found.
            return const Center(child: Text('No posts found')); // 「投稿が見つかりません」メッセージを表示します。Display a 'No posts found' message.
          }
        },
      ),
    );
  }
}

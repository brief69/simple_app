import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポートします。Import Flutter material design widgets.
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodの状態管理パッケージをインポートします。Import the Riverpod state management package.
import '../view_models/post_view_model.dart'; // PostViewModelをインポートします。Import the PostViewModel.
import '../widgets/post_widget.dart'; // PostWidgetをインポートします。Import the PostWidget.

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
 // HomeScreenはConsumerWidgetを継承しています。HomeScreen extends ConsumerWidget.
  @override
  Widget build(BuildContext context, WidgetRef ref) { // ウィジェットのビルドメソッド。Widget build method.
    final postViewModel = ref.watch(postViewModelProvider); // PostViewModelを監視します。Watch the PostViewModel.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // アプリバーのタイトルを設定します。Set the app bar title.
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // プロフィール画面に遷移します。Navigate to the profile screen.
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => postViewModel.fetchPosts(), // 投稿をフェッチするためにリフレッシュします。Refresh to fetch posts.
        child: ListView.builder(
          itemCount: postViewModel.posts.length, // 投稿の数を設定します。Set the number of posts.
          itemBuilder: (context, index) { // リストアイテムのビルダー。List item builder.
            final post = postViewModel.posts[index]; // 投稿を取得します。Retrieve the post.
            return PostWidget(post: post); // PostWidgetを表示します。Display the PostWidget.
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post'); // 投稿画面に遷移します。Navigate to the post screen.
        },
        child: const Icon(Icons.add), // アイコンを追加します。Add icon.
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpodパッケージをインポートします。Import the Riverpod package.
import '../models/post_model.dart'; // Postモデルをインポートします。Import the Post model.
import '../services/firestore_service.dart'; // Firestoreサービスをインポートします。Import the Firestore service.

// PostViewModelのプロバイダーを定義します。Define the provider for PostViewModel.
final postViewModelProvider = ChangeNotifierProvider((ref) => PostViewModel());

// PostViewModelクラスを定義します。Define the PostViewModel class.
class PostViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService(); // Firestoreサービスのインスタンスを作成します。Create an instance of FirestoreService.
  List<Post> _posts = []; // 投稿のリストを保持するプライベート変数。Private variable to hold the list of posts.
  List<Post> get posts => _posts; // 投稿のリストを取得するゲッター。Getter to retrieve the list of posts.

  // Firestoreから全ての投稿をフェッチするメソッド。Method to fetch all posts from Firestore.
  Future<void> fetchPosts() async {
    _posts = await _firestoreService.getPosts(); // Firestoreサービスを使用して投稿を取得します。Use Firestore service to fetch posts.
    notifyListeners(); // リスナーに変更を通知します。Notify listeners of changes.
  }

  // 新しい投稿を追加するメソッド。Method to add a new post.
  Future<void> addPost(Post post) async {
    await _firestoreService.addPost(post); // Firestoreサービスを使用して新しい投稿を追加します。Use Firestore service to add the new post.
    _posts.add(post); // ローカルの投稿リストに追加します。Add to the local list of posts.
    notifyListeners(); // リスナーに変更を通知します。Notify listeners of changes.
  }

  // 特定のユーザーの投稿をフェッチするメソッド。Method to fetch posts of a specific user.
  Future<List<Post>> fetchUserPosts(String userId) async {
    var userPosts = await _firestoreService.getUserPosts(userId); // Firestoreサービスを使用してユーザーの投稿を取得します。Use Firestore service to fetch the user's posts.
    return userPosts; // ユーザーの投稿を返します。Return the user's posts.
  }
}

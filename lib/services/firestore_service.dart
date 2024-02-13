import 'package:cloud_firestore/cloud_firestore.dart'; // Cloud Firestoreパッケージをインポートします。Import the Cloud Firestore package.
import '../models/post_model.dart'; // Postモデルをインポートします。Import the Post model.

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestoreのインスタンスを初期化します。Initialize an instance of Firestore.

  // 新しい投稿を追加します。
  // Add a new post
  Future<void> addPost(Post post) async {
    try {
      await _firestore.collection('posts').doc(post.id).set(post.toMap()); // 投稿をFirestoreに追加します。Add the post to Firestore.
    } catch (e) {
      throw Exception('Error adding post: $e'); // 投稿追加時のエラーをスローします。Throw an error if adding the post fails.
    }
  }

  // すべての投稿を取得します。
  // Fetch all posts
  Future<List<Post>> fetchPosts() async {
    try {
      final querySnapshot = await _firestore.collection('posts').get(); // Firestoreからすべての投稿を取得します。Fetch all posts from Firestore.
      return querySnapshot.docs
          .map((doc) => Post.fromMap(doc.data())) // ドキュメントをPostオブジェクトに変換します。Convert documents to Post objects.
          .toList();
    } catch (e) {
      throw Exception('Error fetching posts: $e'); // 投稿取得時のエラーをスローします。Throw an error if fetching posts fails.
    }
  }

  // 特定のユーザーによる投稿を取得します。
  // Fetch posts by a specific user
  Future<List<Post>> fetchPostsByUser(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('posts')
          .where('userId', isEqualTo: userId)
          .get(); // 特定のユーザーIDに基づいて投稿を取得します。Fetch posts based on a specific user ID.
      return querySnapshot.docs
          .map((doc) => Post.fromMap(doc.data()))// ドキュメントをPostオブジェクトに変換します。Convert documents to Post objects.
          .toList();
    } catch (e) {
      throw Exception('Error fetching user posts: $e'); // ユーザー投稿取得時のエラーをスローします。Throw an error if fetching user posts fails.
    }
  }

  // 投稿を更新します。
  // Update a post
  Future<void> updatePost(Post post) async {
    try {
      await _firestore.collection('posts').doc(post.id).update(post.toMap()); // Firestoreの投稿を更新します。Update the post in Firestore.
    } catch (e) {
      throw Exception('Error updating post: $e'); // 投稿更新時のエラーをスローします。Throw an error if updating the post fails.
    }
  }

  // 投稿を削除します。
  // Delete a post
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete(); // Firestoreから投稿を削除します。Delete the post from Firestore.
    } catch (e) {
      throw Exception('Error deleting post: $e'); // 投稿削除時のエラーをスローします。Throw an error if deleting the post fails.
    }
  }

  // 特定のユーザーの投稿を取得するメソッド
  Future<List<Post>> getUserPosts(String userId) async {
    // FirestoreからuserIdに一致する投稿を取得するロジックを実装します。
    // 以下はダミーコードです。
    List<Post> userPosts = [];
    // Firestoreからデータを取得し、userPostsに追加するロジックをここに実装します。
    return userPosts;
  }

  // Firestoreから全ての投稿を取得するメソッド
  Future<List<Post>> getPosts() async {
    // Firestoreからデータをフェッチし、Postのリストとして返す処理をここに実装します。
    // 以下はダミーの実装例です。
    return []; // 実際にはFirestoreから取得した投稿のリストを返すようにしてください。
  }
}



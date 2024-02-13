
// Postクラスを定義します。Defines the Post class.
class Post {
  // 各フィールドを定義します。Defines each field.
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;

  // コンストラクタを定義します。Defines the constructor.
  Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  // MapからPostオブジェクトを生成するファクトリメソッド。Factory method to create a Post object from a Map.
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      userId: map['userId'] as String,
      content: map['content'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  // PostオブジェクトをMapに変換するメソッド。Method to convert a Post object to a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}

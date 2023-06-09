import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/news_model/news.dart';

part 'forum_provider.freezed.dart';

@freezed
abstract class ForumNewsState with _$ForumNewsState {
  const factory ForumNewsState({
    @Default({}) Map<String, Map<String, String>> newsContent,  // Map<newUid, Map<title, String>>
    @Default({}) Map<String, Map<String, List<String>>> comments,  // Map<newsUid, Map<name, comments>>
    @Default({}) Map<String, int> likes,  // Map<newsUid, numberOfLikes>
    @Default(true) isLoading,
  }) = _ForumNewsState;

  const ForumNewsState._();
}

final forumNewsProvider = StateNotifierProvider<ForumNewsNotifier, ForumNewsState>(
        (ref) => ForumNewsNotifier());

class ForumNewsNotifier extends StateNotifier<ForumNewsState> {
  String? _uid;
  CollectionReference? _db;

  ForumNewsNotifier() : super(const ForumNewsState()) {
    _uid = FirebaseAuth.instance.currentUser!.uid;
    _db = FirebaseFirestore.instance.collection("forum");
  }

  void updateAuthState() {
    _uid = FirebaseAuth.instance.currentUser!.uid;
    _db = FirebaseFirestore.instance.collection("forum");
  }

  void getNews(String newsid) {
    state = state.copyWith(isLoading: true);
    final docRef = _db!.doc(newsid);
    Map<String, String> data;
    Map<String, Map<String, String>> tempNewsContent = Map.of(state.newsContent);
    docRef.get().then(
    (DocumentSnapshot doc) {
    data = doc.data() as Map<String, String>;
    tempNewsContent[newsid] = data;
    },
    onError: (e) => print("Error getting document: $e"),
    ).whenComplete(() =>  state = state.copyWith(isLoading: false, newsContent: tempNewsContent) );
  }

  void addNews(String newsId, NewsModel model){
    final data = model.toJson();

    // TODO parse model and add data
    final collection = _db!.doc(newsId).set(data);
  }

  void removeNews(String newsId) {
    state = state.copyWith(isLoading: true);

    // TODO complete delete
    final collection = _db!.doc(newsId).delete();

    state = state.copyWith(isLoading: false);
  }
}
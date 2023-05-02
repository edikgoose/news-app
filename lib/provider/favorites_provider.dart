import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'favorites_provider.freezed.dart';

@freezed
abstract class FavNewsState with _$FavNewsState {
  const factory FavNewsState({
    @Default([]) List<Map<String, bool>> favorites,  // List<Map<newsUid, like>>
    @Default(true) isLoading,
  }) = _FavNewsState;

  const FavNewsState._();
}

final favNewsProvider = StateNotifierProvider<FavNewsNotifier, FavNewsState>(
    (ref) => FavNewsNotifier());

class FavNewsNotifier extends StateNotifier<FavNewsState> {
  String? _uid;
  CollectionReference? _db;

  FavNewsNotifier() : super(const FavNewsState()) {
    _uid = FirebaseAuth.instance.currentUser!.uid;
    _db = FirebaseFirestore.instance.collection("users");

    loadFavorites();
  }

  void updateAuthState() {
    _uid = FirebaseAuth.instance.currentUser!.uid;
    _db = FirebaseFirestore.instance.collection("users");
    loadFavorites();
  }

  void loadFavorites() async {
    if (_uid != null && _db != null) {
      try {
        final collection = await _db!.doc(_uid).collection("favorites").get();
        final data = collection.docs.map((doc) => doc.data()).toList();

        if (data.isNotEmpty) {

          List<Map<String, bool>> tempList = [];
          for (var item in data) {
            tempList.add({'value': item['value']});
          }

          state = state.copyWith(favorites: tempList);
        } else {
          state = state.copyWith(favorites: []);
        }
      } on FirebaseAuthException catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    } else {
      if (kDebugMode) {
        print("user or db are not defined");
      }
    }
  }

  void removeData() {
    if (_uid != null && _db != null) {
      try {
         _db!.doc(_uid).delete();
      } on FirebaseAuthException catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    } else {
      if (kDebugMode) {
        print("user or db are not defined");
      }
    }
  }

  void toggleFavorite(String newsUid) {
    state = state.copyWith(isLoading: true);
    final data = <String, bool>{
      "like": false,
    };
    final collection = _db!.doc(_uid).collection("favorites").doc(newsUid).set(data);

    state = state.copyWith(isLoading: false);
  }

  void removeFavorite(String newsUid) {
    state = state.copyWith(isLoading: true);

    final collection = _db!.doc(_uid).collection("favorites").doc(newsUid).delete();

    state = state.copyWith(isLoading: false);
  }
}
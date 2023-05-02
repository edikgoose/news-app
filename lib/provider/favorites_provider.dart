import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/news_model/news.dart';

part 'favorites_provider.freezed.dart';

@freezed
abstract class FavNewsState with _$FavNewsState {
  const factory FavNewsState({
    @Default([]) List<NewsModel> favorites,
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
        final snapshot = collection.docs.map((doc) => doc.data()).toList();

        if (snapshot.isNotEmpty) {
          // List<dynamic> jsonFav = json.decode(jsonEncode(snapshot.));
          // List<String> tempFav = jsonFav.map((e) => e.toString()).toList();
          
          state = state.copyWith(favorites: snapshot);
        } else {
          _updateDb([]);
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

  void _updateDb(List<NewsModel> news) {
    if (_uid != null && _db != null) {
      try {
        _db!.doc(_uid).collection("favorites").
        update({"user_favorites": news});
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

  void toggleFavorite(String value) {
    state = state.copyWith(isLoading: true);
    List<String> tempFav = [for (final fav in state.favorites) fav];

    if (!tempFav.contains(value)) {
      tempFav.add(value);
    }
    _updateDb(tempFav);
    state = state.copyWith(isLoading: false, favorites: tempFav);
  }

  void removeFavorite(String jokeToRem) {
    state = state.copyWith(isLoading: true);
    List<String> tempFav = [];
    for (final fav in state.favorites) {
      if (fav != jokeToRem) {
        tempFav.add(fav);
      }
    }
    _updateDb(tempFav);
    state = state.copyWith(isLoading: false, favorites: tempFav);
  }
}
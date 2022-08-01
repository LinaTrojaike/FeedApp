// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.post.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DatailsPost on _DatailsPost, Store {
  late final _$postSelectedAtom =
      Atom(name: '_DatailsPost.postSelected', context: context);

  @override
  PostModel get postSelected {
    _$postSelectedAtom.reportRead();
    return super.postSelected;
  }

  @override
  set postSelected(PostModel value) {
    _$postSelectedAtom.reportWrite(value, super.postSelected, () {
      super.postSelected = value;
    });
  }

  late final _$_DatailsPostActionController =
      ActionController(name: '_DatailsPost', context: context);

  @override
  void selectPost(PostModel post) {
    final _$actionInfo = _$_DatailsPostActionController.startAction(
        name: '_DatailsPost.selectPost');
    try {
      return super.selectPost(post);
    } finally {
      _$_DatailsPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postSelected: ${postSelected}
    ''';
  }
}

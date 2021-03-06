// Mocks generated by Mockito 5.0.2 from annotations
// in flutter_mvvm/test/ui/details_view_model_test.dart.
// Do not manually edit this file.

import 'package:flutter_mvvm/response/question.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeOwner extends _i1.Fake implements _i2.Owner {}

/// A class which mocks [Question].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuestion extends _i1.Mock implements _i2.Question {
  MockQuestion() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> get tags =>
      (super.noSuchMethod(Invocation.getter(#tags), returnValue: <String>[])
          as List<String>);
  @override
  _i2.Owner get owner =>
      (super.noSuchMethod(Invocation.getter(#owner), returnValue: _FakeOwner())
          as _i2.Owner);
  @override
  String get link =>
      (super.noSuchMethod(Invocation.getter(#link), returnValue: '') as String);
  @override
  String get title =>
      (super.noSuchMethod(Invocation.getter(#title), returnValue: '')
          as String);
}

/// A class which mocks [Owner].
///
/// See the documentation for Mockito's code generation for more information.
class MockOwner extends _i1.Mock implements _i2.Owner {
  MockOwner() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get displayName =>
      (super.noSuchMethod(Invocation.getter(#displayName), returnValue: '')
          as String);
}

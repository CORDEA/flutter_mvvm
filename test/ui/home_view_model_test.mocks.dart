// Mocks generated by Mockito 5.0.2 from annotations
// in flutter_mvvm/test/ui/home_view_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_mvvm/repository/question.dart' as _i2;
import 'package:flutter_mvvm/response/question.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [QuestionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuestionRepository extends _i1.Mock
    implements _i2.QuestionRepository {
  MockQuestionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Question>> findAll() =>
      (super.noSuchMethod(Invocation.method(#findAll, []),
              returnValue: Future.value(<_i4.Question>[]))
          as _i3.Future<List<_i4.Question>>);
}

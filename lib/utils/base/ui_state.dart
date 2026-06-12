import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
sealed class UiState<T> with _$UiState<T> {
  const UiState._();

  const factory UiState.loading() = Loading<T>;

  const factory UiState.success(T data) = Success<T>;

  const factory UiState.failure(String message) = Failure<T>;

  // freezed 3.x 부터 when/map 자동 생성이 제거되어 직접 구현.
  // 기존 호출부(.when(loading:, success:, failure:))를 그대로 유지하기 위함.
  R when<R>({
    required R Function() loading,
    required R Function(T data) success,
    required R Function(String message) failure,
  }) {
    final state = this;
    return switch (state) {
      Loading<T>() => loading(),
      Success<T>() => success(state.data),
      Failure<T>() => failure(state.message),
    };
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState<T> with _$UiState<T> {
  const factory UiState.loading() = Loading<T>;

  const factory UiState.empty() = Empty<T>;

  const factory UiState.success(T data) = Success<T>;

  const factory UiState.failure(String message) = Failure<T>;
}

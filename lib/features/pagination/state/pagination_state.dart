import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state.freezed.dart';

@freezed

/// State of App in Pagination
abstract class PaginationState<T> with _$PaginationState<T> {
  ///When state contains data
  const factory PaginationState.data(List<T> items) = _Data;

  /// When state is loading
  const factory PaginationState.loading() = _Loading;

  /// When state has errors
  const factory PaginationState.error(Object? e, [StackTrace? stk]) = _Error;

  /// State is loading on next batch or fetch
  const factory PaginationState.onGoingLoading(List<T> items) = _OnGoingLoading;

  /// State contains erroron next batch or fetch

  const factory PaginationState.onGoingError(
    List<T> items,
    Object? e, [
    StackTrace? stk,
  ]) = _OnGoingError;
}

// ignore_for_file: inference_failure_on_instance_creation

import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/features/pagination/state/pagination_state.dart';

/// Pagination Provider provider the current pagination state
class PaginationProvider<T> extends StateNotifier<PaginationState<T>> {
  ///Instance of [PaginationProvider]
  PaginationProvider({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PaginationState.loading());

  /// Fetch Next Items Function
  final Future<PaginatedResponse<T>> Function(int pageIndex) fetchNextItems;

  /// Number of Items per transaction
  final int itemsPerBatch;

  final List<T> _items = [];

  /// Page number to fetch data
  int pageIndex = 0;

  Timer _timer = Timer(Duration.zero, () {});

  /// defines if there is more list times
  bool noMoreItems = false;

  /// Initialization with calling first batch
  void init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  /// Updates current state
  void updateData(PaginatedResponse<T> result) {
    noMoreItems = result.page == result.totalPages;

    if (result.results.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      pageIndex = result.page + 1;
      state = PaginationState.data(_items..addAll(result.results));
    }
  }

  /// Fetches  the first page data
  Future<void> fetchFirstBatch() async {
    try {
      state = const PaginationState.loading();
      final result = _items.isEmpty
          ? await fetchNextItems(1)
          : await fetchNextItems(pageIndex);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  /// Fetched the next page data
  Future<void> fetchNextBatch() async {
    if (_timer.isActive && _items.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});
    if (noMoreItems) {
      return;
    }

    if (state == PaginationState<T>.onGoingLoading(_items)) {
      log('Rejected');
      return;
    }
    state = PaginationState.onGoingLoading(_items);

    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await fetchNextItems(pageIndex);
      updateData(result);
    } catch (e, stk) {
      log('Error fetching next page', error: e, stackTrace: stk);
      state = PaginationState.onGoingError(_items, e, stk);
    }
  }
}

class BaseState<T> {
  final bool isLoading;
  final T? data;
  final String? error;

  const BaseState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  BaseState<T> copyWith({
    bool? isLoading,
    T? data,
    String? error,
  }) {
    return BaseState<T>(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

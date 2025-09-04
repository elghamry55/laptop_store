part of 'body_cubit.dart';

@immutable
sealed class BodyState {}

final class BodyInitial extends BodyState {}
final class BodyloadingState extends BodyState {}
final class BodySuccessState extends BodyState {
  final List<ProductModel> product;

  BodySuccessState({required this.product});
}

part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}
final class CardLoadingState extends CardState {}
final class CardDeleteState extends CardState {}
final class CardSuccessState extends CardState {}
final class CardGetState extends CardState {
  final List<ProductModel> product;

  CardGetState({required this.product});
}






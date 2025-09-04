part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoadingState extends FavoriteState {}
final class FavoriteAddSuccessState extends FavoriteState {}
final class FavoriteDeleteSuccessState extends FavoriteState {}
final class FavoriteGetSuccessState extends FavoriteState {

  final List<ProductModel> product;

  FavoriteGetSuccessState({required this.product});
}












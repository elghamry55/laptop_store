import 'package:bloc/bloc.dart';
import 'package:laptop_store/core/features/favorite/data/favorite_data.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  addFavoriteCubit({required ProductModel product}) async {
    List<ProductModel> currentFavorites = [];
    if (state is FavoriteGetSuccessState) {
      currentFavorites = List.from((state as FavoriteGetSuccessState).product);
    }

    currentFavorites.add(product);
    await FavoriteData.addFavorite(id: product.id);
    emit(FavoriteGetSuccessState(product: currentFavorites));
  }

  deleteFavoriteCubit({required String id}) async {
    if (state is FavoriteGetSuccessState) {
      List<ProductModel> currentFavorites = List.from(
        (state as FavoriteGetSuccessState).product,
      );

      currentFavorites.removeWhere((p) => p.id == id);
      await FavoriteData.deleteFavorite(id: id);
      emit(FavoriteGetSuccessState(product: currentFavorites));
    }
  }


  getFavoriteCubit() async {
    emit(FavoriteLoadingState());
    var list = await FavoriteData.getFavorite();
    emit(FavoriteGetSuccessState(product: list));
  }


}

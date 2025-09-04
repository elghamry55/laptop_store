import 'package:bloc/bloc.dart';
import 'package:laptop_store/core/features/card/data/card-data.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  addCardCubit({required String id}) async {
    emit(CardLoadingState());
    await CardData.addCard(id: id);
    emit(CardSuccessState());
    await getCardCubit();
  }
 deleteCardCubit({required String id}) async {
    await CardData.deleteCard(id: id);
    emit(CardDeleteState());
    await getCardCubit();
  }

getCardCubit() async {
    var list = await CardData.getCard();
    emit(CardGetState(product: list));
  }
}

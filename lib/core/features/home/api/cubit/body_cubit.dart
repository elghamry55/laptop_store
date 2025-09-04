import 'package:bloc/bloc.dart';
import 'package:laptop_store/core/features/home/api/data/product_data.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';
import 'package:meta/meta.dart';

part 'body_state.dart';

class BodyCubit extends Cubit<BodyState> {
  BodyCubit() : super(BodyInitial());

  ProductData product = ProductData();

  getDataCubit() async {
    emit(BodyloadingState());
    emit(BodySuccessState(product: await product.getData()));
  }
}

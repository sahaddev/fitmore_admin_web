import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/product_usecase.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductUsecase _productUsecase = ProductUsecase();
  String? _pickedImageBase64;

  String? get pickedImageBase64 => _pickedImageBase64;

  CreateProductBloc() : super(const CreateProductStateInitial()) {
    on<_PickImage>(_onPickImage);
    on<_CreateProduct>(_onCreateProduct);
  }

  FutureOr<void> _onPickImage(
    _PickImage event,
    Emitter<CreateProductState> emit,
  ) async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final bytes = result.files.single.bytes!;
        final extension = result.files.single.extension ?? 'png';
        _pickedImageBase64 =
            'data:image/$extension;base64,${base64Encode(bytes)}';

        // Return to initial state so UI re-renders with the image preview
        emit(const CreateProductState.initial());
      }
    } catch (e) {
      emit(CreateProductState.failure('Failed to pick image: $e'));
    }
  }

  FutureOr<void> _onCreateProduct(
    _CreateProduct event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(const CreateProductState.loading());
    try {
      final productToCreate = _pickedImageBase64 != null
          ? ProductEntity(
              id: event.product.id,
              title: event.product.title,
              subTitle: event.product.subTitle,
              description: event.product.description,
              imageOne: _pickedImageBase64!,
              imageTwo: event.product.imageTwo,
              imageThree: event.product.imageThree,
              imageFour: event.product.imageFour,
              price: event.product.price,
              category: event.product.category,
              quantity: event.product.quantity,
              active: event.product.active,
            )
          : event.product;

      await _productUsecase.createProduct(productToCreate);
      emit(const CreateProductState.success());
    } catch (e) {
      emit(CreateProductState.failure(e.toString()));
    }
  }
}

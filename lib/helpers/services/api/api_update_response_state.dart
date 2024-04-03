//import 'package:app24_user_app/modules/my_account/UpdateResponse/UpdateResponse_transaction_model.dart';

abstract class UpdateResponseState {
  const UpdateResponseState();
}

class UpdateResponseInitial extends UpdateResponseState {
  const UpdateResponseInitial();
}

class UpdateResponseLoading extends UpdateResponseState {
  const UpdateResponseLoading();
}

class UpdateResponseLoaded extends UpdateResponseState {
  final dynamic updateResponse;

  const UpdateResponseLoaded(this.updateResponse);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateResponseLoaded &&
        other.updateResponse == updateResponse;
  }

  @override
  int get hashCode => updateResponse.hashCode;
}

class UpdateResponseError extends UpdateResponseState {
  final String message;

  const UpdateResponseError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateResponseError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

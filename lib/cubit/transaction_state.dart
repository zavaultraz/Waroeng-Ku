part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions;

  TransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

final class FailedTransactionLoaded extends TransactionState {
  final String message;

  FailedTransactionLoaded(this.message);

  @override
  List<Object> get props => [message];
}


part of 'food_cubit.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

final class FoodLoaded extends FoodState {
  final List<Food> foods;

  FoodLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}

final class FailedFoodLoaded extends FoodState {
  final String message;

  FailedFoodLoaded(this.message);

  @override
  List<Object> get props => [message];
}
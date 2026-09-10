part of 'bottom_nav_cubit.dart';

sealed class BottomNavState extends Equatable {
  final int currentIndex;
  const BottomNavState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

final class BottomNavCurrentIndexState extends BottomNavState {
  const BottomNavCurrentIndexState({required super.currentIndex});
}

final class BottomNavInitial extends BottomNavState {
  const BottomNavInitial() : super(currentIndex: 0);
}

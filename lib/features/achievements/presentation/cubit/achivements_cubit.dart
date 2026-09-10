import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'achivements_state.dart';

class AchivementsCubit extends Cubit<AchivementsState> {
  AchivementsCubit() : super(AchivementsInitial());
}

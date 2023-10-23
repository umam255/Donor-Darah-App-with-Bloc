// ignore_for_file: avoid_print
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/job/job_data.dart';
import '../../../../../domain/repository/job/job_repository.dart';
part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository repository;
  JobCubit(this.repository) : super(const JobState());

  Future<void> fetchJob() async {
    emit(JobIsLoading());

    final response = await repository.fetchJob();
    if (response is ResultSuccess) {
      emit(JobIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(JobIsFailed(message: "Data Not Found"));
    }
  }
}

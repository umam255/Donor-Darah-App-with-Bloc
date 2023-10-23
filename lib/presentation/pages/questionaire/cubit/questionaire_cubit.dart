import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_answer_request.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';
import 'package:donor_darah/domain/repository/questionaire/questionaire_repository.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';

part 'questionaire_state.dart';

class QuestionaireCubit extends Cubit<QuestionaireState> {
  final QuestionaireRepository repository;

  QuestionaireCubit(this.repository) : super(QuestionaireInitial());

  Future btnQuestionaire(int idSchedule, Map<String, dynamic> answers) async {
    List<QuestionaireAnswerRequest> answerRequests = [];
    answers.forEach((key, value) {
      answerRequests.add(QuestionaireAnswerRequest(key, value));
    });

    QuestionaireRequest request = QuestionaireRequest(
      idSchedule,
      answerRequests,
    );

    emit(QuestionaireIsLoading());

    final token = await Commons().getUid();

    final response = await repository.submitQuestionaire(
      AuthenticationHeadersRequest(token!),
      request,
    );
    // print('CUBIT : ${response.toString()}');
    // print("Jawaban Cubit : ${jsonEncode(request.toJson())}");

    if (response is ResultSuccess) {
      if (response.data == null) {
        emit(QuestionaireIsSuccess(message: "Berhasil"));
      }
    } else {
      emit(QuestionaireIsError(message: "EROOR CUBIT"));
    }
  }
}

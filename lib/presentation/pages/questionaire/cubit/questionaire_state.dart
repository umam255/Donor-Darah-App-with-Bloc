// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'questionaire_cubit.dart';

abstract class QuestionaireState extends Equatable {
  const QuestionaireState();

  @override
  List<Object> get props => [];
}

class QuestionaireInitial extends QuestionaireState {}

class QuestionaireIsLoading extends QuestionaireState {}

// ignore: must_be_immutable
class QuestionaireIsSuccess extends QuestionaireState {
  String message;
  QuestionaireIsSuccess({
    required this.message,
  });
}

// ignore: must_be_immutable
class QuestionaireIsError extends QuestionaireState {
  String? message;
  QuestionaireIsError({
    this.message,
  });
}

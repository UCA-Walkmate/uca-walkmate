import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/infrastructure.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';

final subjectProvider = StateNotifierProvider<SubjectNotifier, SubjectState>((ref) {
  final user = ref.watch(authProvider).user;

  final subjectRepository = SubjectRepositoryImpl(
    SubjectDatasourceImpl(accessToken: user!.token),
  );

  return SubjectNotifier(
    subjectRepository: subjectRepository, 
    user: user,
  );
});

class SubjectNotifier extends StateNotifier<SubjectState> {
  final SubjectRepository subjectRepository;
  final User user;

  SubjectNotifier({
    required this.subjectRepository,
    required this.user,
  }) : super(SubjectState()) {
    getSubjectsByUserId(user.id);
  }

  Future<void> getSubjectsByUserId(int userId) async {
    state = state.copyWith(isLoading: true);

    final subjects = await subjectRepository.getSubjectsByUserId(userId);

    state = state.copyWith(
      subjects: subjects,
      isLoading: false,
    );
  }
}

class SubjectState {
  final List<Subject> subjects;
  final bool isLoading;

  SubjectState({
    this.subjects = const [],
    this.isLoading = false,
  });

  SubjectState copyWith({
    List<Subject>? subjects,
    bool? isLoading,
  }) {
    return SubjectState(
      subjects: subjects ?? this.subjects,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
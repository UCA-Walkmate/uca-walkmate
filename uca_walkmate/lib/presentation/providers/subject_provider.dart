import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/infrastructure.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';

final subjectProvider = StateNotifierProvider<SubjectNotifier, SubjectState>((ref) {
  final user = ref.watch(authProvider).user;

  final subjectRepository = SubjectRepositoryImpl(
    SubjectDatasourceImpl(accessToken: user!.token, userId: user.id)
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
    getLocations();
  }

  Future<void> getSubjectsByUserId(int userId) async {
    state = state.copyWith(isLoading: true);

    final subjects = await subjectRepository.getSubjectsByUserId(userId);

    state = state.copyWith(
      subjects: subjects,
      isLoading: false,
    );
  }

  Future<void> getLocations() async {
    final locations = await subjectRepository.getLocations();

    state = state.copyWith(
      locations: locations
    );
  }

  Future<void> addSubject(String name, int locationId, String schedule, String status, int image) async {
    await subjectRepository.addSubject(name, locationId, schedule, status, image);

    getSubjectsByUserId(user.id);
  }

  Future<void> deleteSubjectById(int subjectId) async {
    await subjectRepository.deleteSubjectById(subjectId);

    getSubjectsByUserId(user.id);
  }
}

class SubjectState {
  final List<Subject> subjects;
  final List<Location> locations;
  final bool isLoading;

  SubjectState({
    this.subjects = const [],
    this.locations = const [],
    this.isLoading = false,
  });

  SubjectState copyWith({
    List<Subject>? subjects,
    List<Location>? locations,
    bool? isLoading,
  }) {
    return SubjectState(
      subjects: subjects ?? this.subjects,
      locations: locations ?? this.locations,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
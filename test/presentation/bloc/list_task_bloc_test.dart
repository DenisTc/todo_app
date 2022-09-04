import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/data/repositories/app_repository_impl.dart';
import 'package:todo_app/src/presentation/cubit/list_task/list_task_cubit.dart';

class MockTaskRepository extends Mock implements AppRepositoryImpl {}

void main() async {
  late ListTaskCubit cubit;
  late MockTaskRepository mockTaskRepository;

  final tasks = [
    TaskModel(
      id: '810f71b7-b03f-4d7b-a5eb-1588fe29d9b1',
      text: 'Text of task #1',
      importance: 'low',
      createdAt: DateTime(2021).millisecondsSinceEpoch + 1,
      changedAt: DateTime(2022).millisecondsSinceEpoch + 1,
      lastUpdatedBy: 'deviceId1',
    ),
    TaskModel(
      id: '810f71b7-b03f-4d7b-a5eb-1588fe29d9b2',
      text: 'Text of task #2',
      importance: 'basic',
      createdAt: DateTime(2021).millisecondsSinceEpoch + 2,
      changedAt: DateTime(2022).millisecondsSinceEpoch + 2,
      lastUpdatedBy: 'deviceId2',
    ),
    TaskModel(
      id: '810f71b7-b03f-4d7b-a5eb-1588fe29d9b3',
      text: 'Text of task #3',
      importance: 'hight',
      createdAt: DateTime(2021).millisecondsSinceEpoch + 3,
      changedAt: DateTime(2022).millisecondsSinceEpoch + 3,
      done: true,
      lastUpdatedBy: 'deviceId3',
    ),
  ];

  setUp(() async {
    mockTaskRepository = MockTaskRepository();
    cubit = ListTaskCubit(mockTaskRepository);
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<ListTaskCubit, ListTaskState>(
    'getting a list of tasks',
    setUp: () => when(() => mockTaskRepository.getAllTasks())
        .thenAnswer((_) async => tasks),
    build: () => cubit,
    act: (cubit) => cubit.loadListTask(),
    expect: () => <ListTaskState>[
      const ListTaskState.loading(),
      ListTaskState.loaded(listTask: tasks, countCompletedTask: 1),
    ],
    verify: (_) async {
      verify(() => mockTaskRepository.getAllTasks()).called(1);
    },
  );
}

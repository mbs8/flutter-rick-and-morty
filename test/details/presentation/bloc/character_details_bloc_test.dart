import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/details/data/details_repository.dart';
import 'package:rick_and_morty/details/data/service/character_details_response.dart';
import 'package:rick_and_morty/details/presentation/bloc/character_details_bloc.dart';

void main() {
  group('character details bloc success flow', () {
    late CharacterDetailsRepository repository;
    late CharacterDetailsBloc bloc;
    late CharacterDetailsResponse response;

    setUp(() async {
      repository = CharacterDetailRepositoryMock();
      response = CharacterDetailResponseMock();
      bloc = CharacterDetailsBloc(repository);

      when(() => repository.fetchCharacterDetails('1'))
          .thenAnswer((_) async => response);
    });

    blocTest(
      'should emit success result',
      build: () => bloc,
      tearDown: () => bloc.close(),
      act: (bloc) => bloc.add(
        const CharacterDetailsRequestEvent('1'),
      ),
      expect: () => [
        CharacterDetailsLoadingState(),
        CharacterDetailsResultState(response)
      ],
      verify: (_) async =>
          {verify(() => repository.fetchCharacterDetails('1')).called(1)},
    );
  });
  group('character details bloc error flow', () {
    late CharacterDetailsRepository repository;
    late CharacterDetailsBloc bloc;

    setUp(() async {
      repository = CharacterDetailRepositoryMock();
      bloc = CharacterDetailsBloc(repository);

      when(() => repository.fetchCharacterDetails('1'))
          .thenThrow((_) async => Exception('Ops something wrong happened'));
    });

    blocTest(
      'should emit error result',
      build: () => bloc,
      tearDown: () => bloc.close(),
      act: (bloc) => bloc.add(
        const CharacterDetailsRequestEvent('1'),
      ),
      expect: () =>
          [CharacterDetailsLoadingState(), CharacterDetailsErrorState()],
    );
  });
}

class CharacterDetailRepositoryMock extends Mock
    implements CharacterDetailsRepository {}

class CharacterDetailResponseMock extends Mock
    implements CharacterDetailsResponse {}

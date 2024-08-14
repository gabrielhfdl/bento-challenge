// lib/config/providers.dart

import 'package:bento_challenge/data/data_source/bento_data_source.dart';
import 'package:bento_challenge/data/data_source/bento_data_source_impl.dart';
import 'package:bento_challenge/data/repository/bento_repository.dart';
import 'package:bento_challenge/data/repository/bento_repository_impl.dart';
import 'package:bento_challenge/domain/use_cases/bento_use_cases_impl.dart';
import 'package:bento_challenge/presentation/bloc/bento_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getBentoProviders() {
    return [
      Provider<BentoDataSource>(
        create: (_) => BentoDataSourceImpl(),
      ),
      Provider<BentoRepository>(
        create: (context) => BentoRepositoryImpl(
          Provider.of<BentoDataSource>(context, listen: false),
        ),
      ),
      ProxyProvider<BentoRepository, BentoUseCasesImpl>(
        update: (_, repository, __) => BentoUseCasesImpl(repository),
      ),
      ProxyProvider<BentoUseCasesImpl, BentoBloc>(
        update: (_, useCases, __) => BentoBloc(useCases),
        dispose: (_, bentoBloc) => bentoBloc.dispose(),
      ),
    ];
  }
}

import 'package:tattoo_manager/main/factories/usecases/add_estudio_factory.dart';
import 'package:tattoo_manager/ui/pages/estudio/estudio_presenter.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

EstudioPresenter makeGetxEstudioPresenter() => GetxEstudioPresenter(
    addEstudio: makeRemoteAddEstudio08(), validation: makeEstudioValidation());

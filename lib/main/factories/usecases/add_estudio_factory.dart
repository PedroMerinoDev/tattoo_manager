import 'package:tattoo_manager/data/usecases/estudio/estudio.dart';
import 'package:tattoo_manager/domain/usecases/estudio/estudio.dart';

import '../factories.dart';

AddEstudio08 makeRemoteAddEstudio08() => RemoteAddEstudio08(
    httpClient: makeHttpAdapter(), url: makeApiUrl('estudio'));

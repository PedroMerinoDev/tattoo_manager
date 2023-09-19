import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tattoo_manager/ui/pages/estudio/estudio_presenter.dart';

import '../../../helpers/helpers.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<EstudioPresenter>(context);
    return StreamBuilder<UIError?>(
      stream: presenter.nameErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.string.name,
            icon:
                Icon(Icons.person, color: Theme.of(context).primaryColorLight),
            errorText: snapshot.data?.description,
          ),
          keyboardType: TextInputType.name,
          onChanged: presenter.validateName,
        );
      },
    );
  }
}

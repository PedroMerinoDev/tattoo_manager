import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tattoo_manager/ui/pages/estudio/estudio_presenter.dart';

import '../../../helpers/helpers.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<EstudioPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.save : null,
            child: Text(R.string.addAccount.toUpperCase()),
          );
        });
  }
}

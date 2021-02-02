import 'package:reactive_forms/reactive_forms.dart';

class TeamBloc {
  final FormGroup teamForm = FormGroup({
    'name': FormControl(validators: [Validators.required])
  });
}

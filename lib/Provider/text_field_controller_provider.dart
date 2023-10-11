import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TextFieldControllerProvider extends ChangeNotifier{
  TextEditingController servicesLoginEmailController = TextEditingController();
  TextEditingController servicesLoginPasswordController = TextEditingController();
  TextEditingController servicesRegisterPasswordController = TextEditingController();
  TextEditingController servicesRegisterConfirmPasswordController = TextEditingController();
  TextEditingController servicesRegisterFullNameController = TextEditingController();
  TextEditingController servicesRegisterEmailController = TextEditingController();
  TextEditingController servicesRegisterPhoneNumberController = TextEditingController();

}
import 'package:provider/provider.dart';
import 'Core/Service/Api.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];


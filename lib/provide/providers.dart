import 'index_provide.dart';

/// create by mzp
///
///
///

List<SingleChildCloneableWidget> getProviders() {
//  final providers = Providers()
//    ..provide(Provider.function((context) => HomePageCarProvide(0)))
//    ..provide(Provider.function((context) => HomePageCategoryProvide([])));

//  return Provider.value(value:  HomePageCarProvide(0));
  return [
    ChangeNotifierProvider(builder: (_) => HomePageCarProvide(0)),
    ChangeNotifierProvider(builder: (_) => HomePageCategoryProvide([])),
  ];
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_platform/app/presentation/bloc/main/app_prefs_cubit.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    _controller.forward().then((v) => _initialize(context));
  }

  Future<void> _initialize(BuildContext context) async {
    await getIt<AppPreferencesCubit>().fetch();

    Future.delayed(const Duration(seconds: 1), () {
      navigateTo(context, HomeRoute());
    });
  }

  Future<void> navigateTo(
      BuildContext context, PageRouteInfo<dynamic> route) async {
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      context.router.replace(route);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          ScaleTransition(
            scale: _animation,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 100,
                  child: Image.asset('./assets/images/brand/splash.png')),
            ),
          ),
          const SizedBox(height: 50),
          FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 500)),
            builder: (context, snapshot) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
                const SizedBox(width: 20),
                Text(LocaleKeys.loading.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300))
              ],
            ),
          )
        ])));
  }
}

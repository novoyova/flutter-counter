import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/core/constants/app_strings.dart';
import 'package:flutter_counter/core/themes/app_theme.dart';
import 'package:flutter_counter/core/utils/app_bloc_observer.dart';
import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_counter/logic/cubit/theme_cubit.dart';
import 'package:flutter_counter/presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context
                .select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
            initialRoute: AppRouter.counter,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

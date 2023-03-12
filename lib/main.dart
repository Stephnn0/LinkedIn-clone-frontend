import 'package:clean_arch_linkedin/config/theme/theme_constants.dart';
import 'package:clean_arch_linkedin/config/theme/theme_manager.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/views/login_screen.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/views/welcome_screen.dart';
import 'package:clean_arch_linkedin/features/feed/presentation/views/main_screen.dart';
import 'package:clean_arch_linkedin/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/auth/presentation/bloc/auth_state.dart';
import 'injections_container.dart' as dependencyInjection;
import 'injections_container.dart';

void main() {
  dependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => serviceLocator<AuthBloc>()..add(AppStarted()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => serviceLocator<PostBloc>()..add(GetPostEvent()),
            )
          ],
          child: ChangeNotifierProvider<ThemeService>(
            create: (context) => ThemeService(),
            child: Consumer(builder: (context, ThemeService theme, _) {
              return MaterialApp(
                  title: 'LinkedIn Clone',
                  debugShowCheckedModeBanner: false,
                  theme: theme.darkTheme! ? darkTheme : lightTheme,
                  home: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is Authenticated) {
                        return const MainScreen();
                      } else if (state is Unauthenticated) {
                        return const LoginScreen();
                      } else {
                        return Container();
                      }
                    },
                  ));
            }),
          ),
        ));
  }
}

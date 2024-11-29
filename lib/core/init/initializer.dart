import 'package:news_app/core/constants/imports.dart';

/// Class responsible for initializing the application.
class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    // Ensure Flutter widgets are initialized.
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load();

    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    );

    await ScreenUtil.ensureScreenSize();

    Bloc.observer = AppBlocObserver();
  }
}

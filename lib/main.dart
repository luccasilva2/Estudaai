import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const EstudaAIApp());
}

class EstudaAIApp extends StatelessWidget {
  const EstudaAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estuda.AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        primaryColor: const Color(0xFF00D4FF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D4FF),
          secondary: Color(0xFF00FF88),
          surface: Color(0xFF1A1A2E),
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
        cardTheme: CardThemeData(
          color: const Color(0xFF1A1A2E),
          elevation: 4,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        ),
      ),

        textTheme: TextTheme(
          headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white70,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.white60,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D4FF),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

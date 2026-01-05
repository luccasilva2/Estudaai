import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';
import 'register_screen.dart';
import 'onboarding_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                'Bem-vindo ao\nestuda.ai',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Aprenda qualquer coisa com IA personalizada',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              GlassCard(
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.inter(color: Colors.white60),
                    prefixIcon: const Icon(Icons.email, color: Color(0xFF00D4FF)),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              GlassCard(
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    hintStyle: GoogleFonts.inter(color: Colors.white60),
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF00D4FF)),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Simulate login
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Entrar',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: Text(
                  'Não tem conta? Cadastre-se',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF00D4FF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

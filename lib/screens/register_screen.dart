import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';
import 'login_screen.dart';
import 'onboarding_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Criar Conta',
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Junte-se ao estuda.ai e comece a aprender',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              GlassCard(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Nome completo',
                    hintStyle: GoogleFonts.inter(color: Colors.white60),
                    prefixIcon: const Icon(Icons.person, color: Color(0xFF00D4FF)),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              GlassCard(
                child: TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Confirmar senha',
                    hintStyle: GoogleFonts.inter(color: Colors.white60),
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF00D4FF)),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Simulate register
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
                  'Cadastrar',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: Text(
                  'Já tem conta? Faça login',
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

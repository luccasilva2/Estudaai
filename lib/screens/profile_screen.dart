import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Perfil',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GlassCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF00D4FF),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'João Silva',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Nível Aprendiz Intermediário',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF00FF88),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Estatísticas',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GlassCard(
                    child: Column(
                      children: [
                        Text(
                          '42',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00D4FF),
                          ),
                        ),
                        Text(
                          'Aulas Concluídas',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GlassCard(
                    child: Column(
                      children: [
                        Text(
                          '156h',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00FF88),
                          ),
                        ),
                        Text(
                          'Tempo Estudado',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Categorias Favoritas',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                FavoriteCategoryChip(label: 'Tecnologia'),
                FavoriteCategoryChip(label: 'Programação'),
                FavoriteCategoryChip(label: 'Finanças'),
                FavoriteCategoryChip(label: 'Saúde'),
              ],
            ),
            const SizedBox(height: 30),
            GlassCard(
              child: ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF00D4FF)),
                title: Text(
                  'Configurações',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
                onTap: () {
                  // Navigate to settings
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteCategoryChip extends StatelessWidget {
  final String label;

  const FavoriteCategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF1A1A2E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xFF00D4FF),
          width: 1,
        ),
      ),
    );
  }
}

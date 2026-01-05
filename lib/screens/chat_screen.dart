import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _conversations = [
    {
      'name': 'Ana Silva',
      'lastMessage': 'Oi! Como vai o estudo de Flutter?',
      'time': '10:30',
      'unread': 2,
      'avatar': 'A',
    },
    {
      'name': 'Carlos Santos',
      'lastMessage': 'Valeu pela dica sobre algoritmos!',
      'time': '09:15',
      'unread': 0,
      'avatar': 'C',
    },
    {
      'name': 'Maria Oliveira',
      'lastMessage': 'Vamos estudar juntos amanhã?',
      'time': 'Ontem',
      'unread': 1,
      'avatar': 'M',
    },
    {
      'name': 'João Pereira',
      'lastMessage': 'Qual livro você recomenda?',
      'time': 'Ontem',
      'unread': 0,
      'avatar': 'J',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Conversas',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Search conversations
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _conversations.length,
        itemBuilder: (context, index) {
          final conversation = _conversations[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChatDetailScreen(
                    name: conversation['name'],
                    avatar: conversation['avatar'],
                  ),
                ),
              );
            },
            child: GlassCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF00D4FF),
                    child: Text(
                      conversation['avatar'],
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              conversation['name'],
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              conversation['time'],
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          conversation['lastMessage'],
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  if (conversation['unread'] > 0)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFF00D4FF),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        conversation['unread'].toString(),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String avatar;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.avatar,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Oi! Como vai o estudo de Flutter?',
      'isMe': false,
      'time': '10:28',
    },
    {
      'text': 'Oi Ana! Indo bem, e você?',
      'isMe': true,
      'time': '10:29',
    },
    {
      'text': 'Também! Vamos trocar dicas?',
      'isMe': false,
      'time': '10:30',
    },
  ];

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
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF00D4FF),
              child: Text(
                widget.avatar,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              widget.name,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // More options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Digite sua mensagem...',
                        hintStyle: GoogleFonts.inter(color: Colors.white60),
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF00D4FF)),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Align(
      alignment: message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: message['isMe']
              ? const Color(0xFF00D4FF)
              : const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message['text'],
              style: GoogleFonts.inter(
                fontSize: 16,
                color: message['isMe'] ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message['time'],
              style: GoogleFonts.inter(
                fontSize: 12,
                color: message['isMe'] ? Colors.black54 : Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text.trim(),
          'isMe': true,
          'time': 'Agora',
        });
      });
      _messageController.clear();
    }
  }
}

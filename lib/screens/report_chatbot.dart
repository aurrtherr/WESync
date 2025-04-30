import 'package:flutter/material.dart';

class ReportChatbot extends StatefulWidget {
  @override
  _ReportChatbotState createState() => _ReportChatbotState();
}

class _ReportChatbotState extends State<ReportChatbot> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];
  int _step = 0;

  final List<String> botReplies = [
    "Hello! I'm here to help you report an issue. What would you like to report?",
    "Got it! You've selected: Illegal Dumping. Can you share the location of the issue?",
    "Thanks! Please upload a photo if you have one.",
    "Photo received. Would you like to submit this report now?",
    "Your report has been submitted to NEA. You’ll be notified when there's an update.",
    "You're welcome! Have a great day."
  ];

  void _sendMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({'type': 'user', 'text': message});

        if (_step < botReplies.length) {
          _messages.add({'type': 'bot', 'text': botReplies[_step]});
          _step++;
        } else {
          _messages.add({
            'type': 'bot',
            'text': "Thank you! You’ve completed the demo."
          });
        }

        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report via Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['type'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(msg['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Type your message..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

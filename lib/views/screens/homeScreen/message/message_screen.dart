import 'package:beast_connect/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'inbox/personal_inbox.dart'; // For formatting date and time

// Main Entry Point
void main() {
  runApp(const MaterialApp(
    home: MessageScreen(),
  ));
}

// MessageScreen Class (Main Screen)
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Message> messages = [
    Message(
      name: 'Rocky Parker',
      lastMessage: 'Your okay fine.',
      time: '08:36 am',
      isUnread: true,
    ),
    Message(
      name: 'Jobless Community Jobless Community',
      lastMessage: 'Your okay fine.',
      time: '08:36 am',
      isUnread: false,
    ),
    Message(
      name: 'IT Job',
      lastMessage: 'Your okay fine.',
      time: '08:36 am',
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: AppColors.quaternaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person_add_alt_1, color: Colors.white),
                      SizedBox(width: 10,),
                      Text('Create Group Message', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Connections',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageTile(
                  name: message.name,
                  lastMessage: message.lastMessage,
                  time: message.time,
                  isUnread: message.isUnread,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Message Class
class Message {
  final String name;
  final String lastMessage;
  final String time;
  final bool isUnread;

  Message({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isUnread,
  });
}

// MessageTile (Each Message Item)
class MessageTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final bool isUnread;

  const MessageTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: Text(
          name[0],
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      subtitle: Text(
        lastMessage,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
          color: isUnread ? AppColors.primaryColor : AppColors.secondaryTextColor,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonalInbox(name: name),
          ),
        );
      },
    );
  }
}

// // PersonalInbox Screen
// class PersonalInbox extends StatefulWidget {
//   final String name; // Receive the name as a parameter
//
//   const PersonalInbox({super.key, required this.name}); // Constructor to accept name
//
//   @override
//   State<PersonalInbox> createState() => _PersonalInboxState();
// }
//
// class _PersonalInboxState extends State<PersonalInbox> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [
//     ChatMessage(message: "Hyyy!!!", isSentByMe: true, time: "3:00 pm"),
//     ChatMessage(message: "When are we meeting? It's been so long!", isSentByMe: false, time: "3:01 pm"),
//     ChatMessage(message: "Hyyyy.... georg.", isSentByMe: true, time: "3:02 pm"),
//     ChatMessage(message: "Next week for sure.", isSentByMe: false, time: "3:02 pm"),
//   ];
//
//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       final newMessage = ChatMessage(
//         message: _controller.text,
//         isSentByMe: true,
//         time: DateFormat('h:mm a').format(DateTime.now()),
//       );
//       setState(() {
//         _messages.add(newMessage);
//       });
//       _controller.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.name} - Chat"),
//         backgroundColor: AppColors.quaternaryColor,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return ChatBubble(
//                   message: message.message,
//                   isSentByMe: message.isSentByMe,
//                   time: message.time,
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: "Send a message...",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // ChatMessage Class
// class ChatMessage {
//   final String message;
//   final bool isSentByMe;
//   final String time;
//
//   ChatMessage({
//     required this.message,
//     required this.isSentByMe,
//     required this.time,
//   });
// }
//
// // ChatBubble Widget
// class ChatBubble extends StatelessWidget {
//   final String message;
//   final bool isSentByMe;
//   final String time;
//
//   ChatBubble({required this.message, required this.isSentByMe, required this.time});
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//               decoration: BoxDecoration(
//                 color: isSentByMe ? Colors.blueAccent : Colors.orangeAccent,
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Text(
//                 message,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 4.0),
//             Text(
//               time,
//               style: TextStyle(fontSize: 12.0, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



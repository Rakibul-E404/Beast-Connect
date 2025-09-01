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




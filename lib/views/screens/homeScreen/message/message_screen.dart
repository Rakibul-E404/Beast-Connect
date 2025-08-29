import 'package:beast_connect/utils/app_colors.dart';
import 'package:beast_connect/widget/buttons/Custom_Elevated_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Message> messages = [
    Message(
      name: 'Rocky Parker',
      lastMessage: 'your okay fine.',
      time: '08:36 am',
      isUnread: true,
    ),
    Message(
      name: 'Josless Community',
      lastMessage: 'your okay fine.',
      time: '08:36 am',
      isUnread: false,
    ),
    Message(
      name: 'Jobless Bangla Community',
      lastMessage: 'your okay fine.',
      time: '08:36 am',
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text('Messages'),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,10,0),
                child: CustomElevatedButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: (){},
                  buttonText: 'Create Group Message',
                  textColor: AppColors.secondaryTextColor,
                  icon: Icon(Icons.person_add_alt_1),

                ),
              ),
            ],
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Connections',
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),

          // Messages List
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
        backgroundColor: Colors.grey[300],
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
          color: isUnread ? Colors.black : Colors.grey,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        /// Navigate to chat screen
      },
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Import DateFormat from intl package
// import '../../../../../utils/app_colors.dart';
//
// // PersonalInbox Screen
// class PersonalInbox extends StatefulWidget {
//   final String name; // Receive the name as a parameter
//
//   const PersonalInbox({
//     super.key,
//     required this.name,
//   }); // Constructor to accept name
//
//   @override
//   State<PersonalInbox> createState() => _PersonalInboxState();
// }
//
// class _PersonalInboxState extends State<PersonalInbox> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [
//     ChatMessage(message: "Hyyy!!!", isSentByMe: true, time: "3:00 pm"),
//     ChatMessage(
//       message: "When are we meeting? It's been so long!",
//       isSentByMe: false,
//       time: "3:01 pm",
//     ),
//     ChatMessage(message: "Hyyyy.... georg.", isSentByMe: true, time: "3:02 pm"),
//     ChatMessage(
//       message: "Next week for sure.",
//       isSentByMe: false,
//       time: "3:02 pm",
//     ),
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
//       backgroundColor: AppColors.quaternaryColor,
//       appBar: AppBar(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/004/320/558/non_2x/group-icon-isolated-sign-symbol-illustration-five-people-gathered-icons-black-and-white-design-free-vector.jpg'),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "${widget.name}",
//               style: TextStyle(color: AppColors.secondaryTextColor),
//             ),
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.green,
//                   maxRadius: 4,
//                 ),
//                 SizedBox(width: 10,),
//                 Text(
//                   "Active Now",
//                   style: TextStyle(color: AppColors.primaryColor,fontSize: 15),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//         backgroundColor: AppColors.quaternaryColor,
//         actions: [
//           ///
//           ///----------------call button
//           ///
//           IconButton(
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     "Audio Call button pressed",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             },
//             icon: Icon(
//               Icons.call,
//               color: AppColors.primaryIconColor,
//             ),
//           ),
//           ///
//           ///----------------video call button
//           ///
//           IconButton(onPressed: (){
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                   "Video Call button pressed",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             );
//           }, icon: Icon(CupertinoIcons.video_camera_solid,color: AppColors.primaryIconColor,)),
//           ///
//           ///----------------more button
//           ///
//           IconButton(
//             onPressed: () {
//               // Scaffold.of(context).openDrawer(); // Open the Drawer
//               EndDrawerButton();
//             },
//             icon: Icon(
//               Icons.more_vert,
//               color: AppColors.primaryIconColor,
//             ),
//           ),
//         ],
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
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: 10.0,
//                         horizontal: 12.0,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
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
//   const ChatBubble({
//     super.key,
//     required this.message,
//     required this.isSentByMe,
//     required this.time,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: isSentByMe
//               ? CrossAxisAlignment.end
//               : CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
//               decoration: BoxDecoration(
//                 color: isSentByMe
//                     ? AppColors.primaryColor
//                     : AppColors.otherUsersMessageColor.withValues(alpha: 0.9),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Text(message, style: TextStyle(color: Colors.white)),
//             ),
//             SizedBox(height: 4.0),
//             Text(time, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
//           ],
//         ),
//       ),
//     );
//   }
// }












import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat from intl package
import '../../../../../utils/app_colors.dart';

// PersonalInbox Screen
class PersonalInbox extends StatefulWidget {
  final String name; // Receive the name as a parameter

  const PersonalInbox({
    super.key,
    required this.name,
  }); // Constructor to accept name

  @override
  State<PersonalInbox> createState() => _PersonalInboxState();
}

class _PersonalInboxState extends State<PersonalInbox> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(message: "Hyyy!!!", isSentByMe: true, time: "3:00 pm"),
    ChatMessage(
      message: "When are we meeting? It's been so long!",
      isSentByMe: false,
      time: "3:01 pm",
    ),
    ChatMessage(message: "Hyyyy.... georg.", isSentByMe: true, time: "3:02 pm"),
    ChatMessage(
      message: "Next week for sure.",
      isSentByMe: false,
      time: "3:02 pm",
    ),
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final newMessage = ChatMessage(
        message: _controller.text,
        isSentByMe: true,
        time: DateFormat('h:mm a').format(DateTime.now()),
      );
      setState(() {
        _messages.add(newMessage);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaternaryColor,
      endDrawer: Positioned(
        top: 10,
        child: SizedBox(
          height: 200,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Text(
                    'Chat Options',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Mute Notifications'),
                  onTap: () {
                    // Handle mute notifications
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Block User'),
                  onTap: () {
                    // Handle block user
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete Chat'),
                  onTap: () {
                    // Handle delete chat
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed:(){

                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white),
            SizedBox(width: 0.8),
            Expanded(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/004/320/558/non_2x/group-icon-isolated-sign-symbol-illustration-five-people-gathered-icons-black-and-white-design-free-vector.jpg',
                ),
              ),
            ),
          ],
        ),
        title: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.name}",
                style: TextStyle(color: AppColors.secondaryTextColor),
                overflow: TextOverflow.ellipsis, // Prevent overflow with ellipsis
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    maxRadius: 4,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Active Now",
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.quaternaryColor,
        actions: [
          ///----------------call button----------------
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Audio Call button pressed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.call,
              color: AppColors.primaryIconColor,
            ),
          ),
          ///----------------video call button----------------
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Video Call button pressed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(CupertinoIcons.video_camera_solid, color: AppColors.primaryIconColor),
          ),
          ///----------------more button----------------
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(
                Icons.more_vert,
                color: AppColors.primaryIconColor,
              ),
            ),
          ),
        ],
      ),


      /*AppBar(
        leading: Row(
          children: [
            Icon(Icons.arrow_back_ios,color: Colors.white,),
            SizedBox(width: 0.8,),
            CircleAvatar(
              backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/004/320/558/non_2x/group-icon-isolated-sign-symbol-illustration-five-people-gathered-icons-black-and-white-design-free-vector.jpg',),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.name}",
              style: TextStyle(color: AppColors.secondaryTextColor),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  maxRadius: 4,
                ),
                SizedBox(width: 10,),
                Text(
                  "Active Now",
                  style: TextStyle(color: AppColors.primaryColor,fontSize: 15),
                ),
              ],
            ),

          ],
        ),
        backgroundColor: AppColors.quaternaryColor,
        actions: [
          ///
          ///----------------call button
          ///
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Audio Call button pressed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.call,
              color: AppColors.primaryIconColor,
            ),
          ),
          ///
          ///----------------video call button
          ///
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Video Call button pressed",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }, icon: Icon(CupertinoIcons.video_camera_solid,color: AppColors.primaryIconColor,)),
          ///
          ///----------------more button
          ///
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(
                Icons.more_vert,
                color: AppColors.primaryIconColor,
              ),
            ),
          ),
        ],
      ),*/
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message.message,
                  isSentByMe: message.isSentByMe,
                  time: message.time,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Send a message...",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ChatMessage Class
class ChatMessage {
  final String message;
  final bool isSentByMe;
  final String time;

  ChatMessage({
    required this.message,
    required this.isSentByMe,
    required this.time,
  });
}

// ChatBubble Widget
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSentByMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: isSentByMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
              decoration: BoxDecoration(
                color: isSentByMe
                    ? AppColors.primaryColor
                    : AppColors.otherUsersMessageColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 4.0),
            Text(time, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utils/app_colors.dart';
import '../../controller/connection_screen_controller.dart';
import '../bio_data/bio_data.dart';

class ConnectionScreenUi extends StatefulWidget {
  final double screenWidth;

  const ConnectionScreenUi({
    super.key,
    required this.screenWidth,
  });

  @override
  _ConnectionScreenUiState createState() => _ConnectionScreenUiState();
}

class _ConnectionScreenUiState extends State<ConnectionScreenUi> {
  final ConnectionScreenController _controller = ConnectionScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Match List',style: TextStyle(color: Colors.white,fontSize: 25),),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.filterIconCircleColor,
            radius: 20,
            child: IconButton(
              onPressed: () {
                _controller.showFilterBottomSheet(context);
              },
              icon: Icon(Icons.filter_alt,color: AppColors.primaryIconColor,size: 23,),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Set the number of columns
            crossAxisSpacing: 12, // Space between columns
            mainAxisSpacing: 12, // Space between rows
          ),
          itemCount: Connections.length, // Using the static data

            itemBuilder: (context, index) {
              var user = Connections[index];
              return GestureDetector(
                onTap: () {
                  Get.to(()=>BioDataScreen(user: user));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(user['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 12,
                        left: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${user['name']} - ${user['age']}",
                                    style: const TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.circle,
                                    color: (user['active'] as bool)
                                        ? Colors.greenAccent
                                        : Colors.grey,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    (user['active'] as bool) ? "Active" : "Offline",
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8,),
                            Row(
                              children: [
                                Text("${user['gender']} - ${user['location']}",style: const TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold))
                              ],
                            )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

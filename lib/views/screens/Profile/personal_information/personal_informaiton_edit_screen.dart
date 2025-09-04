import 'package:flutter/material.dart';



class PersonalInformaitonEditScreen extends StatelessWidget {
  const PersonalInformaitonEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Information',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.deepOrangeAccent,
          surface: Color(0xFF20232A),
          background: Color(0xFF20232A),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF282C34),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.orange, width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      home: const PersonalInfoPage(),
    );
  }
}

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();

  String gender = 'Male';
  List<String> interests = ['Reading', 'Music', 'Sports'];
  List<String> selectedInterests = ['Reading', 'Music', 'Sports'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20232A),
      appBar: AppBar(
        backgroundColor: Color(0xFF20232A),
        title: const Text('Personal Information'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            // Profile Picture Placeholder
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(Icons.person, size: 90, color: Colors.grey[500]),
            ),

            SizedBox(height: 20),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(label: 'Name'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Email'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Phone Number'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Date of Birth'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Location'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Age'),
                  SizedBox(height: 12),
                  // Height Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Height',
                    ),
                    items: [
                      DropdownMenuItem(value: "5'8\"", child: Text("5'8\"")),
                      DropdownMenuItem(value: "5'6\"", child: Text("5'6\"")),
                      DropdownMenuItem(value: "5'10\"", child: Text("5'10\"")),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Education Qualification'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Personal Status'),
                  SizedBox(height: 12),
                  CustomTextField(label: 'Religion'),
                  SizedBox(height: 16),

                  // Gender Selection
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                        activeColor: Colors.orange,
                      ),
                      Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                        activeColor: Colors.orange,
                      ),
                      Text('Female'),
                      Radio<String>(
                        value: 'Non-binary',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                        activeColor: Colors.orange,
                      ),
                      Text('Non-binary'),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Interests
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Add Your Favorite Interest'),
                  ),
                  Wrap(
                    spacing: 8,
                    children: interests
                        .map((interest) => ChoiceChip(
                      label: Text(interest),
                      selected: selectedInterests.contains(interest),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[800],
                      labelStyle: TextStyle(
                          color: selectedInterests.contains(interest) ? Colors.white : Colors.white70),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedInterests.add(interest);
                          } else {
                            selectedInterests.remove(interest);
                          }
                        });
                      },
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 20),

                  // About Section
                  CustomTextField(
                    label: 'About',
                    maxLines: 5,
                  ),
                  SizedBox(height: 24),

                  // Update Profile Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Update Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;

  const CustomTextField({Key? key, required this.label, this.maxLines = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

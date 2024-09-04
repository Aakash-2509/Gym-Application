import 'package:flutter/material.dart';
import 'package:metafit/contants/const_colors.dart';

class Message {
  final String profilePhotoUrl;
  final String name;
  final String location;
  final String message;

  Message({
    required this.profilePhotoUrl,
    required this.name,
    required this.location,
    required this.message,
  });
}

class Sweatyswipemessagescreen extends StatelessWidget {
  final VoidCallback onBack;

  const Sweatyswipemessagescreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final List<Message> messages = [
      Message(
        profilePhotoUrl:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        name: 'S 27',
        location: 'Baner, Pune',
        message: 'Hey! How are you?',
      ),
      Message(
        profilePhotoUrl:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        name: 'S 27',
        location: 'Baner, Pune',
        message: 'Let\'s catch up soon!',
      ),
      Message(
        profilePhotoUrl:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        name: 'S 27',
        location: 'Baner, Pune',
        message: 'What\'s up?',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Match Queue',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ConstColors.doneBtnColor),
                ),
                Text(
                  'List of people who messaged you:',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ConstColors.ageTextColor),
                ),
                Text(
                  'Check your List',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ConstColors.ageTextColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  leading: SizedBox(
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(message.profilePhotoUrl),
                    ),
                  ),
                  title: Text(
                    message.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: ConstColors.msgHeadingTextColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.location,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ConstColors.msgHeadingTextColor),
                      ),
                      Text(
                        message.message,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ConstColors.tinderCardText),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

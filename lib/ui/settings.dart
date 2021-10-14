import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  bool _notifications = false;
  bool _sound = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
              value: _notifications,
              title: const Text('Allow notifications'),
              secondary: const Icon(Icons.notifications),
              onChanged: (bool value) {
                setState(() => _notifications = value);
              }
          ),
          SwitchListTile(
              value: _sound,
              title: const Text('Allow sound'),
              secondary: const Icon(Icons.surround_sound),
              onChanged: (bool value) {
                setState(() => {
                  _sound = !_notifications ? false : value
                });
              }
          ),
        ],
      )
    );
  }
}
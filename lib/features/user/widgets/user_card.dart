import 'package:flutter/material.dart';
import 'package:users_list_demo/features/user/db/user.dart';

class UserCard extends StatelessWidget {
  final UserData userData;

  const UserCard({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage(userData.picture),
        ),
        title: Text('${userData.first.toString()} ${userData.last.toString()}'),
        subtitle: Text('${userData.email.toString()} - ${userData.gender.toString()} - ${userData.cell.toString()}', style: const TextStyle(color: Colors.green)),
      ),
    );
  }
}

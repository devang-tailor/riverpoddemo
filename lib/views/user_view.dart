import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/provider/user_provider.dart';
import 'package:riverpoddemo/widgets/user_list_item.dart';


class UserView extends ConsumerStatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
  @override
  void initState() {
    super.initState();
    // Load users when the widget is first built
    ref.read(userViewModelProvider.notifier).loadUsers(1);
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userViewModelProvider);
    final userViewModel = ref.read(userViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserListItem(user: users[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await userViewModel.addUser('morpheus', 'leader');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_kantin/model/user.dart';
import 'package:flutter_kantin/service/user_service.dart';
import 'package:flutter_kantin/util/capitalize.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = UserApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePages"),
      ),
      body: FutureBuilder(
        future: apiService.getUser(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<User> users = snapshot.data;
            return _buildListView(users);
          } else {
            return Center(
              child: Container(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: null),
    );
  }
}

Widget _buildListView(List<User> users) {
  return ListView.separated(
      itemBuilder: (context, index) {
        User user = users[index];
        return Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(5.0),
          decoration: _mydecor(),
          child: ListTile(
            onTap: () {},
            leading: Icon(Icons.people),
            title: Text(user.fullname),
            subtitle: Text(capitalize(user.gender)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(user.jenjang.toUpperCase()),
                Text(user.phone)
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int i) => Divider(
            color: Colors.white,
          ),
      itemCount: users.length);
}

_mydecor() {
  return BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.all(Radius.circular(5.0)));
}

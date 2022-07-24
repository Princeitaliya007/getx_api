import 'package:flutter/material.dart';
import 'package:getx_api/utils/statics/sizedbox.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(args.image),
            ),
            sizedBoxHeight20,
            Text(
              "Name: ${args.fName} ${args.lName}",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Email: ${args.email}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

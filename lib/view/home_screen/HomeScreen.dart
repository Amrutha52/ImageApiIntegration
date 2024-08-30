import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  void initState() {
    //Widget treeyil ee oru state create aayathinu shesham mathram njn ente baakiyulla kaaryangal execute cheyanam.ethine venamenkil future function aakam, ennalum init future function aavilla
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)
    async
    {
      await Provider.of<HomeScreenController>(context, listen: false).getUserData();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Provider.of<HomeScreenController>(context, listen: false).getUserData();
          }),
      body: Consumer<HomeScreenController>(
        builder: (context, providerObj, child) =>
            Center(
              child: providerObj.isLoading == false ?
              Image.network("${providerObj.random}",
                fit: BoxFit.cover,)
                  : CircularProgressIndicator(),
            ),


      ),
    );
  }
}

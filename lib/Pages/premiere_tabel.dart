import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/premiere_table_controller.dart';

class PremiereTabelPage extends StatelessWidget {
  PremiereTabelPage({super.key});

  final controller = Get.find<PremiereTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Premiere League Table")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: (){
              return controller.fetchPremiereTable();
            },
            child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index) {
                final team = controller.standings[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(team.strBadge),),
                    trailing: Text(team.intPoints),
                    subtitle: Text("Played "+team.intPlayed + " Win "+team.intWin + " Draw "+team.intDraw + " Loss "+team.intLoss),
                    title: Text(team.strTeam.toString())),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ftest/common/sizes.dart';
import 'package:ftest/components/hotel_card.dart';
import 'package:ftest/model/actors.dart';
import 'package:ftest/provider/actor_provider.dart';
import 'package:provider/provider.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  // var details = <String>[
  //   "Only 2 of these price left",
  //   "Reservation possible without a credit card. FREE cancellation",
  //   "Breakfast Include"
  // ];

  // final _hotelList = <Map<String, dynamic>>[
  //   {
  //     'img': "assets/img/img01.png",
  //     'details': [
  //       "Only 2 of these price left",
  //       "Reservation possible without a credit card. FREE cancellation",
  //       "Breakfast Include"
  //     ]
  //   },
  //   {
  //     'img': "assets/img/img01.png",
  //     'details': [
  //       "Only 2 of these price left",
  //       "Reservation possible without a credit card. FREE cancellation",
  //       "Breakfast Include"
  //     ]
  //   },
  //   {
  //     'img': "assets/img/img01.png",
  //     'details': [
  //       "Only 2 of these price left",
  //       "Reservation possible without a credit card. FREE cancellation",
  //       "Breakfast Include"
  //     ]
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),

          ///
          /// Fetch Data & view them
          child: FutureBuilder(
              future: Provider.of<ActorProvider>(context).getDetails(),
              builder: (context, snap) {
                if (snap.hasData &&
                    snap.connectionState == ConnectionState.done) {
                  ///
                  ///
                  final actorsList = snap.data as List<Actor>;

                  ///
                  ///
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                        actorsList.length,
                        (index) => HotelCard(
                            imgProvider: NetworkImage(actorsList[index].img!),
                            details: actorsList[index].occupation!),
                      )
                    ],
                  );
                } else {
                  ///
                  ///  Progress Indicator
                  return SizedBox(
                      width: prefferedWidth(context, 1),
                      height: prefferedHeight(context, 0.5),
                      child: const Center(child: CircularProgressIndicator()));
                }
              }),
        ),
      ),
    );
  }
}

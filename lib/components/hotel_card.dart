import 'package:flutter/material.dart';
import 'package:ftest/common/sizes.dart';
import 'package:ftest/common/space.dart';

// ignore: must_be_immutable
class HotelCard extends StatelessWidget {
  ImageProvider imgProvider;
  List<dynamic> details;

  HotelCard({Key? key, required this.imgProvider, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: prefferedWidth(context, 1) - 32,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.5,
            offset: const Offset(2, 2),
            blurRadius: 14)
      ], borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Image View
            Container(
              width: prefferedWidth(context, 0.34),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                image: DecorationImage(image: imgProvider, fit: BoxFit.cover),
              ),
            ),
            Space.w(16),
            // Details
            Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    details.length,
                    (index) => buildDetailsRow(
                        constraints, details[index].toString())))
          ],
        );
      }),
    );
  }

  Widget buildDetailsRow(BoxConstraints constraints, String details) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(1.6),
              color: Colors.black,
            ),
          ),
          Space.w(8),
          SizedBox(
            width: constraints.minWidth * 0.5 - 16,
            child: Text(
              details,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

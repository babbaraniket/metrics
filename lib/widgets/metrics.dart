import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

const String assetName = 'assets/images/graph.svg';

/* Function: metricsWidget build the metrics widget
*  Parameter: label(STRING (ex: "Upper Body" or "Core"), weight(int 0 to 350)
*  Return: Final container contains label, weight, unit, background circle with graph  */
Container metricsWidget(label, weight) {
  return Container(
    height: bubbleDiameter
        .toDouble(), // height of container equal to diameter of the circle
    width: bubbleDiameter
        .toDouble(), // width of container equal to diameter of the circle
    decoration: bubbleBoxDecoration,
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: ClipRRect(
            // Removing the graph's bottom and making it circular to fit in circle
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(200.0),
              bottomRight: Radius.circular(165.0),
            ),
            child: SvgPicture.asset(assetName),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                label,
                style: labelTextStyle,
              ),
              Text(
                weight.toString(),
                style: weightTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: const Text(
              "lbs",
              style: unitTextStyle,
            ),
          ),
        )
      ],
    ),
  );
}

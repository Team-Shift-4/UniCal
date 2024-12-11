

import 'package:flutter/material.dart';

class CalandarYearHeader extends StatefulWidget {
  @override
  State<CalandarYearHeader> createState() => _CalendarYearHeaderState();
}

class _CalendarYearHeaderState extends State<CalandarYearHeader> {
  DateTime dateContext = DateTime.now();
  bool isSToggled = false;
  bool isHeartToggled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateContext.year.toString(),
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSToggled = !isSToggled;
                });
              },
              child: Container(
                width: 60,
                height: 30,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isSToggled ? Colors.green : Colors.grey.shade300,
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: isSToggled ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      isSToggled ? Icons.text_fields : Icons.label,
                      size: 16,
                      color: isSToggled ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isHeartToggled = !isHeartToggled;
                });
              },
              child: Container(
                width: 60,
                height: 30,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isHeartToggled ? Colors.pink : Colors.grey.shade300,
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: isHeartToggled ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      isHeartToggled ? Icons.favorite : Icons.favorite_border,
                      size: 16,
                      color: isHeartToggled ? Colors.pink : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),                    
          ],
        ),
      ],
    );
  }
}
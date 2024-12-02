import 'package:flutter/material.dart';

class CalendarComponent extends StatefulWidget{
  @override
  State<CalendarComponent> createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent>{
  DateTime dateContext = DateTime.now();
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
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
                        isToggled = !isToggled;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 30,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isToggled ? Colors.blue : Colors.grey.shade300,
                      ),
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 200),
                        alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            isToggled ? Icons.favorite : Icons.favorite_border,
                            size: 16,
                            color: isToggled ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isToggled = !isToggled;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 30,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isToggled ? Colors.blue : Colors.grey.shade300,
                      ),
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 200),
                        alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            isToggled ? Icons.favorite : Icons.favorite_border,
                            size: 16,
                            color: isToggled ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),                    
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Text("test")
        ),
      ],
    );
  }
}
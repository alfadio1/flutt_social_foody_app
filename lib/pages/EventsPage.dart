import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';

// class EventPageLayout extends StatelessWidget {
//   const EventPageLayout({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.all(10),
//       height: 50,
//       //alignment: Alignment.topLeft,
//       decoration: BoxDecoration(
//         color: Colors.lightBlueAccent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text("Events",
//         style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//
//       ),
//     );
//
//   }
// }
class EventPage extends StatefulWidget{
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CalendarTimeline(
              initialDate: DateTime(2021, 1, 01),
              firstDate: DateTime(2021, 1, 01),
              lastDate: DateTime(2021, 12, 31),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              dayNameColor: Colors.black,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.blueAccent,
              dotsColor: Color(0xFF333A47),
              //selectableDayPredicate: (date) => date.day != 23,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F106750336%2F40534283612%2F1%2Foriginal.20200722-162355?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C40%2C1920%2C960&s=8528fee42ad7765ba4693088ffab5ad4'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F89810825%2F194011791043%2F1%2Foriginal.20200128-191729?w=1000&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C75%2C900%2C450&s=5c7114e2569811cb363cb9a21ae26428'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            )
          ],
        ),
      ) ,

    );
  }

}
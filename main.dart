import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'flutter/src/material/time.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{
  TextEditingController dateInputController = TextEditingController();

  @override
  void initState() {
    dateInputController.text = "";
    super.initState();
  }
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeInputController=TextEditingController();
  TimeOfDay? selectedTime;

  //text editing controller for text field

  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("DatePicker on TextField"),
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body:Container(
            padding: EdgeInsets.all(8),
            color: Colors.amber,

            child:Center(
                child:Column(

                  children: [
                    TextField(
                      controller: dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime?pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101)
                        );

                        if(pickedDate != null ){
                          print('Selected Date:${DateFormat('yMMMd').format(pickedDate)}');
                          setState(() {
                            dateinput.text=pickedDate as String;
                          });
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          //String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          //print('SELECTED TIME:$formattedDate'); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement


                        }else{
                          print("Date is not selected");
                        }
                      },
                    ),


                    TextField(
                      controller: timeInputController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Select time",
                      ),
                      readOnly: false,
                      onTap: () async {
                        TimeOfDay? timePiked=await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input);
                        if(timePiked!=null){
                          print('time is:${timePiked.hour}-${timePiked.minute}');
                          setState(() {
                            timeInputController.text=timePiked.toString();
                          });
                        }else{
                          print("time is not selected");
                        }
                      },
                    ),
                  ],
                ),

            )
        )
    );
  }
}
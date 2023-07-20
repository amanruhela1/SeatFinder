import 'package:flutter/material.dart';
import 'package:tasks/splash.dart';

void main() {
  runApp(SeatFinderApp());
}

class SeatFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        hintColor: Colors.orange, // Aesthetic accent color
      ),
      home: SplashScreen(),
    );
  }
}

class SeatFinderScreen extends StatefulWidget {
  @override
  _SeatFinderScreenState createState() => _SeatFinderScreenState();
}

class _SeatFinderScreenState extends State<SeatFinderScreen> {
  String? seatNumber;
  String? berthType;
  String? selectedSeat; 
  ScrollController _scrollController = ScrollController();

  void findBerth() {
    setState(() {
      // Logic to find the berth based on seat number
      if (seatNumber != null && seatNumber!.isNotEmpty) {
        if (int.tryParse(seatNumber!) != null &&
            int.parse(seatNumber!) >= 1 &&
            int.parse(seatNumber!) <= 72) {
          int seat = int.parse(seatNumber!);
          if (seat % 8 == 1 || seat % 8 == 4 || seat % 8 == 7) {
            berthType = 'Lower Berth';
          } else if (seat % 8 == 2 || seat % 8 == 5) {
            berthType = 'Middle Berth';
          } else if (seat % 8 == 3 || seat % 8 == 6) {
            berthType = 'Upper Berth';
          } else if (seat % 8 == 0) {
            berthType = 'Side Upper Berth';
          } else if (seat % 8 == 9 || seat % 8 == 10) {
            berthType = 'Side Lower Berth';
          }
          selectedSeat = seatNumber; // Set the selected seat based on the input value
          _scrollToSeat(selectedSeat!);
        } else {
          berthType = 'Invalid Seat Number';
          selectedSeat = null; // Reset the selected seat if the input is invalid
          _scrollToTop(); // Scroll to the top if the input is invalid
        }
      } else {
        berthType = null;
        selectedSeat = null;
        _scrollToTop(); // Scroll to the top if the input is empty
      }
    });
  }

  void _scrollToSeat(String seat) {
    final seatIndex = int.parse(seat) - 1; // Subtract 1 to get the correct index
    final screenHeight = MediaQuery.of(context).size.height;
    final rowHeight = 80.0; // Height of each row 
    final seatPosition = seatIndex * rowHeight;
    final middleOfScreen = screenHeight / 2;
    final rowOffset = middleOfScreen - rowHeight / 2;
    _scrollController.animateTo(
      seatPosition - rowOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SEAT POSITION FINDER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onEditingComplete: () {
                    if (seatNumber != null && seatNumber!.isNotEmpty) {
                      findBerth();
                    } else {
                      _scrollToTop(); // Scroll to the top if the input is empty
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      seatNumber = value;
                      selectedSeat = value; // Update the selected seat when TextField value changes
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Seat Number',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: false,
                  ),
                  style: TextStyle(color: Colors.black, fontFamily: 'YourCustomFont'),
                  cursorColor: Colors.black,
                ),
              ),
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(Icons.search_off_rounded, size: 40,),
                color: Theme.of(context).hintColor, 
                onPressed: () { 
                  findBerth();
                 },
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     findBerth();
              //   },
              //   child: Text(
              //     'Find Berth',
              //     style: TextStyle(color: Colors.white, fontFamily: 'YourCustomFont'),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Theme.of(context).hintColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('1', 'LB', selectedSeat == '1'),
                  buildSeatTile('2', 'MB', selectedSeat == '2'),
                  buildSeatTile('3', 'UB', selectedSeat == '3'),
                  SizedBox(width: 20),
                  buildSeatTile('4', 'SL', selectedSeat == '4'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('5', 'LB', selectedSeat == '5'),
                  buildSeatTile('6', 'MB', selectedSeat == '6'),
                  buildSeatTile('7', 'UB', selectedSeat == '7'),
                  SizedBox(width: 20),
                  buildSeatTile('8', 'SU', selectedSeat == '8'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('9', 'LB', selectedSeat == '9'),
                  buildSeatTile('10', 'MB', selectedSeat == '10'),
                  buildSeatTile('11', 'UB', selectedSeat == '11'),
                  SizedBox(width: 20),
                  buildSeatTile('12', 'SL', selectedSeat == '12'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('13', 'LB', selectedSeat == '13'),
                  buildSeatTile('14', 'MB', selectedSeat == '14'),
                  buildSeatTile('15', 'UB', selectedSeat == '15'),
                  SizedBox(width: 20),
                  buildSeatTile('16', 'SU', selectedSeat == '16'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('17', 'LB', selectedSeat == '17'),
                  buildSeatTile('18', 'MB', selectedSeat == '18'),
                  buildSeatTile('19', 'UB', selectedSeat == '19'),
                  SizedBox(width: 20),
                  buildSeatTile('20', 'SL', selectedSeat == '20'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('21', 'LB', selectedSeat == '21'),
                  buildSeatTile('22', 'MB', selectedSeat == '22'),
                  buildSeatTile('23', 'UB', selectedSeat == '23'),
                  SizedBox(width: 20),
                  buildSeatTile('24', 'SU', selectedSeat == '24'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('25', 'LB', selectedSeat == '25'),
                  buildSeatTile('26', 'MB', selectedSeat == '26'),
                  buildSeatTile('27', 'UB', selectedSeat == '27'),
                  SizedBox(width: 20),
                  buildSeatTile('28', 'SL', selectedSeat == '28'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('29', 'LB', selectedSeat == '29'),
                  buildSeatTile('30', 'MB', selectedSeat == '30'),
                  buildSeatTile('31', 'UB', selectedSeat == '31'),
                  SizedBox(width: 20),
                  buildSeatTile('32', 'SU', selectedSeat == '32'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('33', 'LB', selectedSeat == '33'),
                  buildSeatTile('34', 'MB', selectedSeat == '34'),
                  buildSeatTile('35', 'UB', selectedSeat == '35'),
                  SizedBox(width: 20),
                  buildSeatTile('36', 'SL', selectedSeat == '36'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('37', 'LB', selectedSeat == '37'),
                  buildSeatTile('38', 'MB', selectedSeat == '38'),
                  buildSeatTile('39', 'UB', selectedSeat == '39'),
                  SizedBox(width: 20),
                  buildSeatTile('40', 'SU', selectedSeat == '40'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('41', 'LB', selectedSeat == '41'),
                  buildSeatTile('42', 'MB', selectedSeat == '42'),
                  buildSeatTile('43', 'UB', selectedSeat == '43'),
                  SizedBox(width: 20),
                  buildSeatTile('44', 'SL', selectedSeat == '44'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('45', 'LB', selectedSeat == '45'),
                  buildSeatTile('46', 'MB', selectedSeat == '46'),
                  buildSeatTile('47', 'UB', selectedSeat == '47'),
                  SizedBox(width: 20),
                  buildSeatTile('48', 'SU', selectedSeat == '48'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('49', 'LB', selectedSeat == '49'),
                  buildSeatTile('50', 'MB', selectedSeat == '50'),
                  buildSeatTile('51', 'UB', selectedSeat == '51'),
                  SizedBox(width: 20),
                  buildSeatTile('52', 'SL', selectedSeat == '52'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('53', 'LB', selectedSeat == '53'),
                  buildSeatTile('54', 'MB', selectedSeat == '54'),
                  buildSeatTile('55', 'UB', selectedSeat == '55'),
                  SizedBox(width: 20),
                  buildSeatTile('56', 'SU', selectedSeat == '56'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('57', 'LB', selectedSeat == '57'),
                  buildSeatTile('58', 'MB', selectedSeat == '58'),
                  buildSeatTile('59', 'UB', selectedSeat == '59'),
                  SizedBox(width: 20),
                  buildSeatTile('60', 'SL', selectedSeat == '60'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('61', 'LB', selectedSeat == '61'),
                  buildSeatTile('62', 'MB', selectedSeat == '62'),
                  buildSeatTile('63', 'UB', selectedSeat == '63'),
                  SizedBox(width: 20),
                  buildSeatTile('64', 'SU', selectedSeat == '64'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('65', 'LB', selectedSeat == '65'),
                  buildSeatTile('66', 'MB', selectedSeat == '66'),
                  buildSeatTile('67', 'UB', selectedSeat == '67'),
                  SizedBox(width: 20),
                  buildSeatTile('68', 'SL', selectedSeat == '68'),
                ],
              ),
              SizedBox(height: 72.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatTile('69', 'LB', selectedSeat == '69'),
                  buildSeatTile('70', 'MB', selectedSeat == '70'),
                  buildSeatTile('71', 'UB', selectedSeat == '71'),
                  SizedBox(width: 20),
                  buildSeatTile('72', 'SL', selectedSeat == '72'),
                ],
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSeatTile(String seat, String type, bool isSelected) {
    final double borderRadius = 12.0;
    final double borderWidth = 2.0;
    final double padding = 8.0;
    final Color backgroundColor = isSelected ? Colors.white : Theme.of(context).hintColor;
    final Color textColor = isSelected ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSeat = seat;
        });
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(width: borderWidth, color: Colors.grey),
          boxShadow: !isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              seat,
              style: TextStyle(fontSize: 16.0, color: textColor),
            ),
            SizedBox(height: 4.0),
            Text(
              type,
              style: TextStyle(fontSize: 14.0, color: textColor),
            ),
            SizedBox(height: 2.0),
            if (!isSelected)
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

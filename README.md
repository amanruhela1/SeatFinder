# Seat Finder App

This is a simple Flutter app called "Seat Finder" that allows users to find the berth type based on the seat number they input. The app provides a visual representation of train seats and displays the corresponding berth type when a seat is selected.

## How it Works

1. The app consists of two main screens: `SplashScreen` (initial screen) and `SeatFinderScreen` (main seat finder screen).

2. The `SplashScreen` is the first screen shown when the app launches. It serves as a loading screen or introduction to the app and is not directly related to the seat finding functionality.

3. The `SeatFinderScreen` is where users can find the berth type for a given seat number. It contains a `TextField` for users to input the seat number and a search button (`IconButton`) to trigger the berth finding process.

4. The user can input the seat number, and upon clicking the search button or pressing "OK" on the keyboard, the app will find the corresponding berth type based on the seat number.

5. The app uses a `ScrollController` to enable auto-scrolling to the selected seat in the UI. It uses the `animateTo` method to smoothly scroll to the selected seat when the berth is found. Additionally, it can scroll to the top when the seat input is empty or when the user interacts without pressing the search icon.

6. The seat representation is displayed in a grid-like layout, where each seat is represented as a `Container` widget with its seat number and berth type. The selected seat is highlighted by changing its background color, and the berth type is displayed below the seat number.

## How to Use

1. Install Flutter and set up your development environment.

2. Create a new Flutter project and replace the `main.dart` file with the provided code.

3. Run the app on your preferred emulator or physical device using the `flutter run` command.

4. The app will show the "Seat Finder" screen with a text input field to enter the seat number.

5. Enter a valid seat number (between 1 and 72) in the text field and press the search icon or tap "OK" on the keyboard to find the berth type for that seat.

6. The app will display the corresponding berth type below the selected seat, and the screen will auto-scroll to the selected seat.

7. If the seat number is invalid (less than 1 or greater than 72), the app will display an "Invalid Seat Number" message, and the screen will auto-scroll to the top.

8. If the seat input is empty, the app will reset the selected seat and auto-scroll to the top.

9. You can tap on any seat to select it, and the corresponding berth type will be displayed below the seat number.

10. The app provides visual feedback for the selected seat by changing its background color and displaying a small bar below the seat number.


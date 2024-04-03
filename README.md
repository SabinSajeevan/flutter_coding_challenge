# flutter_coding_challenge
This project implements a simple Flutter application with two dropdown menus: one for selecting a country and another for selecting a state. The country list and corresponding state lists are loaded from a provided API (documentation not included).

Project Structure:

lib/: Contains all the Dart source code for the application.
main.dart: The main entry point of the application.
modules/: Contains screens used in the application.
constants/: Contains api end-points used in the application.
providers/: Contains any providers used in the application.
models/: Contains any data models used in the application.
helpers/: Contains common helping tools and common used custom widgets used in the application.
helpers/services/api/: Contains any services used for data fetching or API interaction.
pubspec.yaml: The project's configuration file.
Dependencies:

This project uses the following Flutter packages:

flutter: The core Flutter framework.
dio: Used for making API requests if applicable.
google_fonts: Used for using multiple google fonts if applicable.
animated_custom_dropdown: Used for implementing the dropdown menus.
cupertino_icons: Used for the country and state dropdown icons.
flutter_riverpod : Used for managing the application state.
Getting Started:

Clone this repository.
Install the dependencies by running flutter pub get in the project directory.
Run the application using flutter run.
Testing:

Note: Unit tests are recommended for data fetching logic and any custom functionalities. You can use a testing framework like test or mockito. While not implemented in this version, consider adding them in the future.

License:

[No license currently applied]

You can choose to add an open-source license like MIT or Apache 2.0 later. This will clarify how others can use, modify, and distribute your code.

Additional Notes:

This project prioritizes best practices in code structure, formatting, and documentation.
It demonstrates the use of a pre-built package (animated_custom_dropdown) for the dropdown functionality.
Feel free to extend the functionality beyond the minimum requirements.
Contribution:

Pull requests are welcome for improvements and bug fixes. Please follow standard Git branching practices.

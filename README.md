# flutter_coding_challenge
This project implements a simple Flutter application with two dropdown menus: one for selecting a country and another for selecting a state. The country list and corresponding state lists are loaded from a provided API (documentation not included).
<table width="100%" border="0">
  <tr>    
  <td><img src="https://github.com/SabinSajeevan/flutter_coding_challenge/assets/59957418/2304a040-79bb-4343-afd2-f05ffab65b91"></td>
<td><img src="https://github.com/SabinSajeevan/flutter_coding_challenge/assets/59957418/911c92a8-9d55-481a-9936-074fd811a6cc" ></td>
<td><img src="https://github.com/SabinSajeevan/flutter_coding_challenge/assets/59957418/f606d212-5dc4-436a-9a17-5be966b8be27" ></td>
  
</tr>
</table>
Project Structure:

<br/>lib/: Contains all the Dart source code for the application.
<br/>main.dart: The main entry point of the application.
<br/>modules/: Contains screens used in the application.
<br/>constants/: Contains api end-points used in the application.
<br/>providers/: Contains any providers used in the application.
<br/>models/: Contains any data models used in the application.
<br/>helpers/: Contains common helping tools and common used custom widgets used in the application.
<br/>helpers/services/api/: Contains any services used for data fetching or API interaction.
<br/>pubspec.yaml: The project's configuration file.

Dependencies:

This project uses the following Flutter packages:

<br/>flutter: The core Flutter framework.
<br/>dio: Used for making API requests if applicable.
<br/>google_fonts: Used for using multiple google fonts if applicable.
<br/>animated_custom_dropdown: Used for implementing the dropdown menus.
<br/>cupertino_icons: Used for the country and state dropdown icons.
<br/>flutter_riverpod : Used for managing the application state.

Getting Started:

<br/>Clone this repository.
<br/>Install the dependencies by running flutter pub get in the project directory.
<br/>Run the application using flutter run.

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

import 'package:flutter/material.dart';
import 'package:librarymanagement/models/db_book.dart';
import 'package:librarymanagement/widgets/widgets.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _bookAuthorController = TextEditingController();
  final TextEditingController _bookVolumeController = TextEditingController();
  final TextEditingController _bookEditionController = TextEditingController();
  final TextEditingController _bookNumberPageController =
      TextEditingController();
  final TextEditingController _bookPublishingCompanyController =
      TextEditingController();
  final TextEditingController _bookYearPublishingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          url: 'assets/images/mainScreenBackground.jpg',
          filter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Registration",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                TextInput(
                  icon: Icons.theater_comedy,
                  placeholder: 'Name',
                  textInputController: _bookNameController,
                  inputType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.airline_seat_recline_normal_outlined,
                  placeholder: 'Author',
                  textInputController: _bookAuthorController,
                  inputType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.auto_awesome_motion,
                  placeholder: 'Volume',
                  textInputController: _bookVolumeController,
                  inputType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.library_books_rounded,
                  placeholder: 'Edition',
                  textInputController: _bookEditionController,
                  inputType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.reorder,
                  placeholder: 'Number Page',
                  textInputController: _bookNumberPageController,
                  inputType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.card_travel_sharp,
                  placeholder: 'Publishing Company',
                  textInputController: _bookPublishingCompanyController,
                  inputType: TextInputType.emailAddress,
                ),
                TextInput(
                  icon: Icons.event_rounded,
                  placeholder: 'Year of Publishing',
                  textInputController: _bookYearPublishingController,
                  inputType: TextInputType.emailAddress,
                ),
                ElevatedButton(
                    onPressed: () {
                      BookDataBase.addBook(
                        name: _bookNameController.text,
                        author: _bookAuthorController.text,
                        volume: _bookVolumeController.text,
                        edition: _bookEditionController.text,
                        numberPage: _bookNumberPageController.text,
                        publishingCompany:
                            _bookPublishingCompanyController.text,
                        yearPublishing: _bookYearPublishingController.text,
                      );
                      //Clear controllers
                      _bookNameController.clear();
                      _bookAuthorController.clear();
                      _bookVolumeController.clear();
                      _bookEditionController.clear();
                      _bookNumberPageController.clear();
                      _bookPublishingCompanyController.clear();
                      _bookYearPublishingController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Successful'),
                        ),
                      );
                    },
                    child: Text("Save"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

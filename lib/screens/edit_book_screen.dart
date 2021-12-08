import 'package:flutter/material.dart';
import 'package:librarymanagement/models/db_book.dart';
import 'package:librarymanagement/screens/list_books_screen.dart';
import 'package:librarymanagement/screens/management_screen.dart';
import 'package:librarymanagement/widgets/text_input.dart';
import 'package:librarymanagement/widgets/widgets.dart';

class EditBookScreen extends StatefulWidget {
  final dynamic uid;
  final String name;
  final String author;
  final String volume;
  final String edition;
  final String numberPage;
  final String publishingCompany;
  final String yearPublishing;
  final String? image;

  const EditBookScreen({
    Key? key,
    required this.uid,
    required this.name,
    required this.author,
    required this.volume,
    required this.edition,
    required this.numberPage,
    required this.publishingCompany,
    required this.yearPublishing,
    this.image,
  }) : super(key: key);

  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  void initState() {
    nameBookController = TextEditingController(text: widget.name);
    authorBookController = TextEditingController(text: widget.author);
    volumeBookController = TextEditingController(text: widget.volume);
    editionBookController = TextEditingController(text: widget.edition);
    numberPageBookController = TextEditingController(text: widget.numberPage);
    publishingCompanyBookController =
        TextEditingController(text: widget.publishingCompany);
    yearPublishingBookController =
        TextEditingController(text: widget.yearPublishing);
    imageBookController = TextEditingController(text: widget.image);

    super.initState();
  }

  late TextEditingController nameBookController;
  late TextEditingController authorBookController;
  late TextEditingController volumeBookController;
  late TextEditingController editionBookController;
  late TextEditingController numberPageBookController;
  late TextEditingController publishingCompanyBookController;
  late TextEditingController yearPublishingBookController;
  late TextEditingController imageBookController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Management"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () {
              BookDataBase.deleteBook(
                  uid: widget.uid,
                  onSuccess: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Successfully deleted')));
                  },
                  onFail: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('UnsSuccessfully deleted')));
                  });
            },
          ),
          IconButton(
            icon: const Icon(Icons.last_page),
            tooltip: 'Previus',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ManagementScreen()));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          BackgroundImage(
            url: 'assets/images/mainScreenBackground.jpg',
            filter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Edit/Delete Book",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    icon: Icons.theater_comedy,
                    placeholder: 'Name',
                    textInputController: nameBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    icon: Icons.airline_seat_recline_normal_outlined,
                    placeholder: 'Author',
                    textInputController: authorBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    icon: Icons.auto_awesome_motion,
                    placeholder: 'Volume',
                    textInputController: volumeBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    icon: Icons.library_books_rounded,
                    placeholder: 'Edition',
                    textInputController: editionBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    icon: Icons.reorder,
                    placeholder: 'Number Page',
                    textInputController: numberPageBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    icon: Icons.card_travel_sharp,
                    placeholder: 'Publishing Company',
                    textInputController: publishingCompanyBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInput(
                    icon: Icons.event_rounded,
                    placeholder: 'Year of Publishing',
                    textInputController: yearPublishingBookController,
                    inputType: TextInputType.emailAddress,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BookDataBase.updateBook(
                          widget.uid,
                          nameBookController.text,
                          authorBookController.text,
                          volumeBookController.text,
                          editionBookController.text,
                          numberPageBookController.text,
                          publishingCompanyBookController.text,
                          yearPublishingBookController.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Successful'),
                          ),
                        );
                      },
                      child: Text("Save Edit"))
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}

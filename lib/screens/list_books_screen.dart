import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:librarymanagement/models/db_book.dart';
import 'package:librarymanagement/screens/edit_book_screen.dart';
import 'package:librarymanagement/widgets/widgets.dart';

class ListBookScreen extends StatefulWidget {
  const ListBookScreen({Key? key}) : super(key: key);

  @override
  _ListBookScreenState createState() => _ListBookScreenState();
}

class _ListBookScreenState extends State<ListBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          url: 'assets/images/mainScreenBackground.jpg',
          filter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: BookDataBase.booksList(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Não existe dados no Firebase!!!");
                } else if (snapshot.hasData || snapshot.data != null) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          String uidBook = snapshot.data!.docs[index].id;
                          String nameBook =
                              snapshot.data!.docs[index].get('name');
                          String authorBook =
                              snapshot.data!.docs[index].get('author');
                          String volumeBook =
                              snapshot.data!.docs[index].get('volume');
                          String edtionBook =
                              snapshot.data!.docs[index].get('edition');
                          String numberPageBook =
                              snapshot.data!.docs[index].get('numberPage');
                          String publishingCompanyBook = snapshot
                              .data!.docs[index]
                              .get('publishingCompany');
                          String yearPublishingBook =
                              snapshot.data!.docs[index].get('yearPublishing');

                          var imageBook =
                              snapshot.data!.docs[index].get('image');

                          return Card(
                            color: Colors.purple[100],
                            borderOnForeground: true,
                            child: Center(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.book, size: 50),
                                      title: Text('$nameBook'),
                                      subtitle: Text('Author: $authorBook'),
                                      onTap: () => {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditBookScreen(
                                                        uid: uidBook,
                                                        name: nameBook,
                                                        author: authorBook,
                                                        volume: volumeBook,
                                                        edition: edtionBook,
                                                        numberPage:
                                                            numberPageBook,
                                                        publishingCompany:
                                                            publishingCompanyBook,
                                                        yearPublishing:
                                                            yearPublishingBook,
                                                        image: imageBook)))
                                      },
                                    ),
                                  ]),
                            ),
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }
}

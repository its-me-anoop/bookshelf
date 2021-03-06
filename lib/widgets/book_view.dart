import 'package:bookshelf/constants/colors/theme_color.dart';
import 'package:bookshelf/models/book_model.dart';
import 'package:bookshelf/repository/sample_content.dart';
import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView(
    this.id, {
    Key? key,
  }) : super(key: key);

  final int id;
  //Book book;

  @override
  Widget build(BuildContext context) {
    Book book = books.firstWhere((element) => element.id == id);
    return Container(
      width: 130,
      decoration: BoxDecoration(
          color: foregroundLight,
          image: DecorationImage(
              image: NetworkImage(book.bookCover), fit: BoxFit.cover),
          boxShadow: [
            if (Theme.of(context).brightness == Brightness.light)
              const BoxShadow(
                  blurRadius: 10, color: Colors.grey, offset: Offset(5, 0))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              book.bookTitle,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.bookAuthor,
              style: const TextStyle(color: Colors.white, fontSize: 8),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

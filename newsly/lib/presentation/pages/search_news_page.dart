import 'package:flutter/material.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/screens/news_details_screen.dart';
import 'package:newsly/data/remote/news_service.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();
  List<News> _news = [];

  void loadData() {
    NewsService().searchNews(_controller.text).then(
      (value) {
        setState(() {
          _news = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: TextField(
            onSubmitted: (value) {
              loadData();
            },
            controller: _controller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailsScreen(news: _news[index])));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: _news[index].title,
                        child: Image.network(
                          _news[index].urlToImage,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 150,
                              child: Center(child: Text("No image found.")),
                            );
                          },
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        _news[index].title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(_news[index].author),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

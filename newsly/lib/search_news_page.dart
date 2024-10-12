import 'package:flutter/material.dart';
import 'package:newsly/news.dart';
import 'package:newsly/utils.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();
  List<News> _news = [];

  @override
  void initState() {
    super.initState();
    loadData().then(
      (news) {
        setState(() {
          _news = news;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      _news[index].urlToImage,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Text(_news[index].title),
                    Text(_news[index].author),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

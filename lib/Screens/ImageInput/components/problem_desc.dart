import 'package:appford/components/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ProblemDesc extends StatefulWidget {
  final Size size;
  final String url;

  ProblemDesc({
    this.size,
    this.url,
  });

  @override
  _ProblemDescState createState() => _ProblemDescState();
}

class _ProblemDescState extends State<ProblemDesc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          height: 250,
          width: widget.size.width,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Image.network(widget.url.toString()),
        ),
        SizedBox(
          width: 10,
        ),
        FetchData(url: widget.url.toString()),
      ],
    );
  }
}

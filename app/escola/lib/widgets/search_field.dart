import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final GlobalKey formKey;
  final Function runFilter;
  final Animation<Offset> slideAnimation;
  final Animation<double> opacityAnimation;
  final Function onSubmitted;

  const SearchField(this.formKey, this.runFilter, this.onSubmitted,
      this.slideAnimation, this.opacityAnimation,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: TextField(
            onChanged: (text) => runFilter(text),
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              hintText: 'Insert class name here',
            ),
            onSubmitted: (_) {
              onSubmitted();
            },
          ),
        ),
      ),
    );
  }
}

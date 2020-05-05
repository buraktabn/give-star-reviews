library givestarreviews;

import 'package:flutter/material.dart';

class GiveStarReviews extends StatelessWidget {
  final List<GiveStarData> starData;
  final double spaceBetween;

  GiveStarReviews({@required this.starData, this.spaceBetween = 17.0})
      : assert(starData != null);

  @override
  Widget build(BuildContext context) {
    return _createList(this.starData, this.spaceBetween);
  }

  Widget _createList(List<GiveStarData> list, double space) {
    List<Widget> tmp = new List<Widget>();

    for (var x in list) {
      tmp.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            x.text,
            style: x.textStyle ?? TextStyle(fontSize: 16),
          ),
          StarRating(
            value: x.value,
            onChanged: x.onChanged,
            filledStar: x.filledStar,
            unfilledStar: x.unfilledStar,
            size: x.size,
            spaceBetween: x.spaceBetween,
            activeStarColor: x.activeStarColor,
            inactiveStarColor: x.inactiveStarColor,
          ),
        ],
      ));
    }

    return Column(
        children: List.generate(list.length + list.length, (i) {
      if (i % 2 == 0) {
        return SizedBox(
          height: space,
        );
      }

      return tmp[i ~/ 2];
    }));
  }
}

class StarRating extends StatefulWidget {
  final void Function(int index) onChanged;
  int value;
  final IconData filledStar;
  final IconData unfilledStar;
  final double size;
  final double spaceBetween;
  final Color activeStarColor;
  final Color inactiveStarColor;

  StarRating(
      {Key key,
      @required this.onChanged,
      this.value = 0,
      this.filledStar,
      this.unfilledStar,
      this.spaceBetween = 5,
      this.size = 25,
      this.activeStarColor = const Color(0xffffd900),
      this.inactiveStarColor = Colors.black54})
      : assert(value != null),
        super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).accentColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget.value = widget.value == index + 1 ? index : index + 1;
            });
            widget.onChanged(widget.value);
          },
          child: Container(
            padding:
                EdgeInsets.only(left: index == 0 ? 0 : widget.spaceBetween),
            child: Icon(
              index < widget.value
                  ? widget.filledStar ?? Icons.star
                  : widget.unfilledStar ?? Icons.star_border,
              color: index < widget.value
                  ? widget.activeStarColor
                  : widget.inactiveStarColor,
              size: widget.size,
            ),
          ),
        );
      }),
    );
  }
}

class GiveStarData {
  final String text;
  final TextStyle textStyle;
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;
  final double size;
  final double spaceBetween;
  final Color activeStarColor;
  final Color inactiveStarColor;

  GiveStarData(
      {@required this.text,
      @required this.onChanged,
      this.textStyle,
      this.value = 0,
      this.filledStar,
      this.unfilledStar,
      this.size = 25,
      this.spaceBetween = 5,
      this.activeStarColor = const Color(0xffffd900),
      this.inactiveStarColor = Colors.black54})
      : assert(text != null),
        assert(onChanged != null);
}

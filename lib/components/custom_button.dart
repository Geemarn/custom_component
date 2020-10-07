import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Icon frontIcon;
  final Icon backIcon;
  final Color color;
  final String text;
  CustomButton(
      {this.onPressed, this.frontIcon, this.backIcon, this.color, this.text});
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Positioned(
          bottom: 22,
          left: 190,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300.0),
            child: Container(
              height: 56,
              width: 56,
              color: color,
            ),
          ),
        ),
        InkResponse(
          onTap: onPressed,
          // containedInkWell: true,
          radius: 200,
          // borderRadius: BorderRadius.circular(100),
          splashColor: Theme.of(context).accentColor,
          child: ClipPath(
            clipper: _ButtonClipper(),
            child: Container(
              width: 220,
              height: 80,
              margin: const EdgeInsets.fromLTRB(10, 10, 30, 10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (frontIcon != null)
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: IconTheme(
                        data: new IconThemeData(color: Colors.white, size: 26),
                        child: frontIcon,
                      ),
                    ),
                  if (text != null)
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  if (backIcon != null)
                    Container(
                      child: IconTheme(
                        data: new IconThemeData(color: Colors.white, size: 26),
                        child: backIcon,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * -0.2, size.height * 0);
    path.lineTo(size.width * 2.2, size.height * 0.5);
    path.lineTo(size.width * -0.2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_ButtonClipper oldClipper) => false;
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  final int position;

  CustomButton({this.onPressed, this.icon, this.position});

  @override
  Widget build(BuildContext context) {
    return new Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          new CustomPaint(
            painter: new _ButtonPainter(
                // strokeColor: Colors.black, paintingStyle: PaintingStyle.fill
                ),
            size: Size(300.0, 80.0),
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Continue",
                      style: TextStyle(fontSize: 20, color: Colors.white,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 5, 5, 5),
                    child: IconTheme(
                      data: new IconThemeData(color: Colors.white),
                      child: icon,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}

class _ButtonPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;

  _ButtonPainter(
      {this.strokeColor = Colors.blueAccent,
      this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    //set props to paint
    paint.color = strokeColor;
    paint.style = paintingStyle;
    paint.strokeWidth = 1.0;
    var path = Path();
    // draw path
    path.moveTo(size.width * 0.25, size.height * 0);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.05,
        size.width * 0.9, size.height * 0.3);
    path.quadraticBezierTo(
        size.width, size.height * 0.5, size.width * 0.9, size.height * 0.72);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.93,
        size.width * 0.25, size.height * 0.95);
    path.quadraticBezierTo(
        size.width * 0, size.height * 0.85, size.width * 0.05, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.05,
        size.width * 0.25, size.height * 0);
    
    canvas.drawShadow(path, Colors.grey[300], 7.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ButtonPainter oldDelegate) {
    return true;
  }
}

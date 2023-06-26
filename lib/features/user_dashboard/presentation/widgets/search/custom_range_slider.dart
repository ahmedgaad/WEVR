import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  double _lowerValue = 0.0;
  double _upperValue = 100.0;
  double _minValue = 0.0;
  double _maxValue = 100.0;
  double _sliderWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _sliderWidth,
      child: Stack(
        children: [
          Slider(
            value: _lowerValue,
            min: _minValue,
            max: _maxValue,
            onChanged: (double newValue) {
              setState(() {
                _lowerValue = newValue;
              });
            },
          ),
          Slider(
            value: _upperValue,
            min: _minValue,
            max: _maxValue,
            onChanged: (double newValue) {
              setState(() {
                _upperValue = newValue;
              });
            },
          ),
          CustomPaint(
            painter: RangeSliderPainter(
              lowerValue: _lowerValue,
              upperValue: _upperValue,
              minValue: _minValue,
              maxValue: _maxValue,
              sliderWidth: _sliderWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class RangeSliderPainter extends CustomPainter {
  final double lowerValue;
  final double upperValue;
  final double minValue;
  final double maxValue;
  final double sliderWidth;

  RangeSliderPainter({
    required this.lowerValue,
    required this.upperValue,
    required this.minValue,
    required this.maxValue,
    required this.sliderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double sliderHeight = 4.0;
    final double thumbRadius = 10.0;

    final double sliderLeft = thumbRadius;
    final double sliderRight = sliderWidth - thumbRadius;
    final double sliderTop = size.height / 2 - sliderHeight / 2;
    final double sliderBottom = size.height / 2 + sliderHeight / 2;

    final double lowerThumbX =
        sliderLeft + (lowerValue - minValue) / (maxValue - minValue) *
            (sliderRight - sliderLeft);
    final double upperThumbX =
        sliderLeft + (upperValue - minValue) / (maxValue - minValue) *
            (sliderRight - sliderLeft);

    // Draw track
    final trackPaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = sliderHeight
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(sliderLeft, sliderTop),
      Offset(sliderRight, sliderTop),
      trackPaint,
    );

    // Draw range
    final rangePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = sliderHeight
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(lowerThumbX, sliderTop),
      Offset(upperThumbX, sliderTop),
      rangePaint,
    );

    // Draw thumbs
    final thumbPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(lowerThumbX, sliderTop), thumbRadius, thumbPaint);
    canvas.drawCircle(Offset(upperThumbX, sliderTop), thumbRadius, thumbPaint);
  }

  @override
  bool shouldRepaint(RangeSliderPainter oldDelegate) {
    return oldDelegate.lowerValue != lowerValue ||
        oldDelegate.upperValue != upperValue ||
        oldDelegate.minValue != minValue ||
        oldDelegate.maxValue != maxValue ||
        oldDelegate.sliderWidth != sliderWidth;
  }
}

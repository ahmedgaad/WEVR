import 'package:flutter/material.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

class ReadMoreText extends StatefulWidget {
  final String text;

  const ReadMoreText({Key? key, required this.text}) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        // alignment: Alignment.bottomRight,
        children: [
          Expanded(
            child: Text(
              widget.text,
              maxLines: _isExpanded ? null : 2,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
              style: getRegularStylePoppins(
                fontSize: 14.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'read less' : 'read more',
              // textAlign: TextAlign.start,
              style: getRegularStylePoppins(
                fontSize: 14.0,
                color: ColorManager.primary,
              ),

            ),
          ),
        ],
      ),
    );
  }
}

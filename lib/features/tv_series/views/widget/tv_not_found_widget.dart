import 'package:flutter/material.dart';

/// TV Not Found With
class TVNotFoundWidget extends StatelessWidget {
  /// Instance of  [TVNotFoundWidget]
  const TVNotFoundWidget({
    required this.message,
    super.key,
  });

  /// Error Message for Error Widget
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Image.asset(
              'assets/search_not_found.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 0,
            child: Text(
              message,
              // style: kHeading6.copyWith(
              //   color: Colors.white,
              //   fontSize: 16,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

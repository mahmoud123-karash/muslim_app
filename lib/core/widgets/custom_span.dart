import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';

TextSpan span({
  required String text,
  required int pageIndex,
  required bool isSelected,
  double? fontSize,
  required int surahNum,
  required int ayahNum,
  LongPressStartDetailsFunction? onLongPressStart,
  required bool isFirstAyah,
  required Color textColor,
  double height = 1.8,
}) {
  if (text.isNotEmpty) {
    final String partOne = text.length < 3 ? text[0] : text[0] + text[1];
    final String? partTwo =
        text.length > 2 ? text.substring(2, text.length - 1) : null;
    final String initialPart = text.substring(0, text.length - 1);
    final String lastCharacter = text.substring(text.length - 1);
    TextSpan? first;
    TextSpan? second;
    if (isFirstAyah) {
      first = TextSpan(
        text: partOne,
        style: TextStyle(
          fontFamily: 'page${pageIndex + 1}',
          fontSize: fontSize,
          height: height,
          color: textColor,
          letterSpacing: 30,
        ),
        recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 200),
        )..onLongPressStart = onLongPressStart,
      );
      second = TextSpan(
        text: partTwo,
        style: TextStyle(
          fontFamily: 'page${pageIndex + 1}',
          fontSize: fontSize,
          height: height,
          letterSpacing: 5,
          color: textColor,
        ),
        recognizer: LongPressGestureRecognizer(
          duration: const Duration(milliseconds: 200),
        )..onLongPressStart = onLongPressStart,
      );
    }

    final TextSpan initialTextSpan = TextSpan(
      text: initialPart,
      style: TextStyle(
        fontFamily: 'page${pageIndex + 1}',
        fontSize: fontSize,
        height: height,
        color: textColor,
        letterSpacing: 5,
      ),
      recognizer: LongPressGestureRecognizer(
        duration: const Duration(milliseconds: 200),
      )..onLongPressStart = onLongPressStart,
    );

    final TextSpan lastCharacterSpan = TextSpan(
      text: lastCharacter,
      style: TextStyle(
        fontFamily: 'page${pageIndex + 1}',
        fontSize: fontSize,
        height: height,
        letterSpacing: 5,
        color: secondColor,
        backgroundColor: Colors.transparent,
      ),
      recognizer: LongPressGestureRecognizer(
        duration: const Duration(milliseconds: 200),
      )..onLongPressStart = onLongPressStart,
    );

    return TextSpan(
      children: isFirstAyah
          ? [first!, second!, lastCharacterSpan]
          : [initialTextSpan, lastCharacterSpan],
      recognizer: LongPressGestureRecognizer(
        duration: const Duration(milliseconds: 200),
      )..onLongPressStart = onLongPressStart,
    );
  } else {
    return const TextSpan(text: '');
  }
}

typedef LongPressStartDetailsFunction = void Function(LongPressStartDetails)?;

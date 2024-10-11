
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rohittest/appstyle/text_box_decoration.dart';

extension ExtendText on Text {
  regularText(Color color, double textSize,
      {TextAlign? align, maxLines, overflow}) {
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: align,
        style: ViewDecoration.textStyle(
          textSize.sp,
          color,
          FontWeight.w400,
        ));
  }

  mediumText(Color color, double textSize,
      {TextAlign? align, maxLines, overflow}) {
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: align,
        style: ViewDecoration.textStyle(textSize.sp, color, FontWeight.w500));
  }

  semiBoldText(Color color, double textSize,
      {TextAlign? align, maxLines, overflow}) {
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: align,
        style: ViewDecoration.textStyle(textSize.sp, color, FontWeight.w600));
  }

  boldText(Color color, double textSize,
      {TextAlign? align, maxLines, overflow}) {
    return Text(data!,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: align,
        style: ViewDecoration.textStyle(textSize.sp, color, FontWeight.w700));
  }
}
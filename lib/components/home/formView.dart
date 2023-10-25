import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class TipeView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TipeView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<TipeView> createState() => _TipeViewState();
}

class _TipeViewState extends State<TipeView> {
  List<String> _listKonseling = [
    'Konseling Pribadi',
    'Konseling Kuliah',
    'Konseling Sosial'
  ];

  String? _selectedKonseling;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 3),
          child: AnimatedBuilder(
            animation: widget.animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: widget.animation!,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - widget.animation!.value), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double
                          .infinity, // Ubah dari double.maxFinite ke double.infinity
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.17),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: Container(
                          child: SizedBox(
                            height: 25,
                            child: DropdownButton<String>(
                              value: _selectedKonseling,
                              items: _listKonseling.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? selectedItem) {
                                setState(() {
                                  _selectedKonseling = selectedItem;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black38,
                              ),
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text(
                                'Pilih Tipe Konseling',
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

// Form Topik
class TopikView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TopikView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 3),
          child: AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: animation!,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation!.value), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: double
                          .infinity, // Ubah dari double.maxFinite ke double.infinity
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.17),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: Container(
                          child: SizedBox(
                            height: 25,
                            child: TextFormField(
                              controller: null,
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                              cursorColor: Color.fromARGB(255, 121, 164, 233),
                              decoration: InputDecoration(
                                  hintText: 'Apa yang ingin kamu bicarakan?',
                                  hintStyle: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(top: 0, bottom: 11),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

// from Tempat
class TempatView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TempatView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 3),
          child: AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: animation!,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation!.value), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 5),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: double
                          .infinity, // Ubah dari double.maxFinite ke double.infinity
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.17),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: Container(
                          child: SizedBox(
                            height: 25,
                            child: TextFormField(
                              controller: null,
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                              cursorColor: Color.fromARGB(255, 121, 164, 233),
                              decoration: InputDecoration(
                                  hintText:
                                      'Dimana kamu ingin melakukan konseling?',
                                  hintStyle: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(top: 0, bottom: 11),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

// from Tanggal
class TanggalView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TanggalView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<TanggalView> createState() => _TanggalViewState();
}

class _TanggalViewState extends State<TanggalView> {
  List<DateTime?> _dialogCalendarPickerValue = [DateTime.now()];

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        // final endDate = values.length > 1
        //     ? values[1].toString().replaceAll('00:00:00.000', '')
        //     : 'null';
        valueText = '$startDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 3),
          child: AnimatedBuilder(
            animation: widget.animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: widget.animation!,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - widget.animation!.value), 0.0),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 5),
                      child: _buildCalendarDialogButton()),
                ),
              );
            },
          )),
    );
  }

  _buildCalendarDialogButton() {
    const dayTextStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final weekendTextStyle =
        TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: Color.fromARGB(255, 121, 164, 233),
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return GestureDetector(
      onTap: () async {
        final values = await showCalendarDatePicker2Dialog(
          context: context,
          config: config,
          dialogSize: const Size(300, 300),
          borderRadius: BorderRadius.circular(10),
          value: _dialogCalendarPickerValue,
          dialogBackgroundColor: Colors.white,
        );
        if (values != null) {
          print(_getValueText(
            config.calendarType,
            values,
          ));
          setState(() {
            _dialogCalendarPickerValue = values;
            print(values);

            String inputDateString = values.toString();

            DateTime dateTime = DateTime.parse(
                inputDateString.substring(1, inputDateString.length - 1));

            String formattedDate = DateFormat('MMMM dd').format(dateTime);

            print(formattedDate);
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.17),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Expanded(
          child: Container(
            child: SizedBox(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(parseDateString(_dialogCalendarPickerValue.toString()),
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )),
                    Icon(
                      Icons.date_range,
                      size: 20,
                      color: Colors.black38,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  String parseDateString(String dateString) {
    // Parse the date string into a DateTime object
    DateTime dateTime =
        DateTime.parse(dateString.substring(1, dateString.length - 1));

    // Format the DateTime object into "September 09" format
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

    return formattedDate;
  }
}

// Form waktu
class WaktuView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const WaktuView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<WaktuView> createState() => _WaktuViewState();
}

class _WaktuViewState extends State<WaktuView> {
  DateTime jamMulai = DateTime(0);
  DateTime jamSelesai = DateTime(0);

  void _openTimeMulai(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        saveButtonColor: Color.fromARGB(255, 121, 164, 233),
        sheetCloseIconColor: Color.fromARGB(255, 121, 164, 233),
        sheetCloseIcon: Icons.close_rounded,
        minuteTitleStyle: TextStyle(color: Color.fromARGB(255, 121, 164, 233)),
        hourTitleStyle: TextStyle(
            color: Color.fromARGB(255, 121, 164, 233),
            fontWeight: FontWeight.w800),
        wheelNumberSelectedStyle: TextStyle(color: Color(0xff7F669D)),
        sheetTitle: 'Pilih Jam Mulai',
        minuteTitle: 'Menit',
        hourTitle: 'Jam',
        saveButtonText: 'Simpan',
      ),
    );

    if (result != null) {
      setState(() {
        jamMulai = result;
      });
    }
  }

  void _openTimeSelesai(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        saveButtonColor: Color.fromARGB(255, 121, 164, 233),
        sheetCloseIconColor: Color.fromARGB(255, 121, 164, 233),
        sheetCloseIcon: Icons.close_rounded,
        minuteTitleStyle: TextStyle(color: Color.fromARGB(255, 121, 164, 233)),
        hourTitleStyle: TextStyle(
            color: Color.fromARGB(255, 121, 164, 233),
            fontWeight: FontWeight.w800),
        wheelNumberSelectedStyle: TextStyle(color: Color(0xff7F669D)),
        sheetTitle: 'Pilih Jam Mulai',
        minuteTitle: 'Menit',
        hourTitle: 'Jam',
        saveButtonText: 'Simpan',
      ),
    );

    if (result != null) {
      setState(() {
        jamSelesai = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 3),
          child: AnimatedBuilder(
            animation: widget.animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: widget.animation!,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - widget.animation!.value), 0.0),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _openTimeMulai(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.17),
                                        spreadRadius: 3,
                                        blurRadius: 6,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${DateFormat('HH:mm').format(jamMulai)}',
                                          style: GoogleFonts.quicksand(
                                            textStyle: TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          )),
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 20,
                                        color: Colors.black38,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _openTimeSelesai(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.17),
                                        spreadRadius: 3,
                                        blurRadius: 6,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${DateFormat('HH:mm').format(jamSelesai)}',
                                          style: GoogleFonts.quicksand(
                                            textStyle: TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          )),
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 20,
                                        color: Colors.black38,
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          )),
    );
  }
}

// Form Button
class ButtonView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ButtonView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 3),
          child: AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: animation!,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation!.value), 0.0),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff0A2647),
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Batalkan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff0A2647),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff0A2647),
                                border: Border.all(
                                    color: Colors.black45,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Kirim',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          )),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}

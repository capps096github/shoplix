import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';

class SelectDateTimeNavBar extends ConsumerWidget {
  const SelectDateTimeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final isTimeDate1Set = watch(isTimeDate1SetProvider).state;
    final orderDate = watch(orderDateProvider).state;
    final orderTime = watch(orderTimeProvider).state;

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        TextButton.icon(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              isTimeDate1Set ? kalyaFavoritePink : kalyaOrange50,
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          onPressed: () async {
            await pickDate(context, orderDate);

            await pickTime(context, orderTime);
          },
          icon: Icon(CupertinoIcons.calendar_today,
              color: isTimeDate1Set ? kalyaWhite : kalyaBrown900),
          label: Text(
            isTimeDate1Set
                ? 'Change Selected Date & Time'
                : 'Select Date & Time',
            style: TextStyle(
              color: isTimeDate1Set ? kalyaWhite : kalyaBrown900,
              fontWeight: FontWeight.w900,
            ),
            key: const ValueKey('confirm'),
          ),
        ),
        if (isTimeDate1Set)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            child: DialogButton(
              textColor: kalyaBrown900,
              buttonColor: kalyaOrange50,
              icon: Icons.arrow_forward,
              text: 'CONTINUE',
              onTap: () {
                context.read(isTimeDateSetProvider).state = true;
              },
            ),
          ),
      ],
    );
  }

  Future<void> pickTime(BuildContext context, TimeOfDay orderTime) async {
    final _startTime = TimeOfDay.now();

    final newTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );

    if (newTime != null) {
      context.read(orderTimeProvider).state = newTime;

      context.read(isTimeDate1SetProvider).state = true;
    }
  }

  Future<void> pickDate(BuildContext context, DateTime orderDate) async {
    final _startDate = DateTime.now();
    final _endDate = DateTime.now().add(const Duration(days: 7));

    final newDate = await showDatePicker(
      context: context,
      initialDate: orderDate,
      firstDate: _startDate,
      lastDate: _endDate,
      helpText: 'SELECT ORDER DATE',
    );
    if (newDate != null && newDate != _startDate) {
      context.read(orderDateProvider).state = newDate;

      // context.read(isTimeDate1SetProvider).state = true;
    }
  }
}

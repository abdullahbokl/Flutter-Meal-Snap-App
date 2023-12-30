import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

ListTile nutrientsListTile({
  required String title,
  required String value,
  required IconData icon,
  Color? trailingColor,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(10),
    leading: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 35,
        color: Colors.orange,
      ),
    ),
    title: Text(
      title,
      style: AppStyles.font16SatoshiBold.copyWith(
        color: Colors.black,
      ),
    ),
    trailing: Text(
      value,
      style: AppStyles.font16SatoshiBold.copyWith(
        color: trailingColor ?? Colors.green,
      ),
    ),
  );
}

ListTile nutrientsBadListTile({
  required String title,
  required String value,
  required String percentOfDailyNeeds,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(10),
    subtitle: Text("$percentOfDailyNeeds% of Daily needs."),
    title: Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    trailing: Text(
      value,
      style: const TextStyle(
          fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
    ),
  );
}

ListTile nutrientsGoodListTile({
  required String title,
  required String value,
  required String percentOfDailyNeeds,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(10),
    subtitle: Text("$percentOfDailyNeeds% of Daily needs."),
    title: Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    trailing: Text(
      value,
      style: const TextStyle(
          fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
    ),
  );
}

import 'package:sales_app/src/resources/models/item_sales.dart';
import 'package:sales_app/src/resources/models/location_sales.dart';
import 'package:sales_app/src/resources/models/temporal_sales.dart';

class Sales {
  Item item;
  Location location;
  Time time;

  Sales({
    this.item,
    this.location,
    this.time,
  });
}

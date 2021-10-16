import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../app_exporter.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final bagHive = watch(bagHiveProvider);
        final orderDataSource = OrderDataSource(bagItems: bagHive.bagItems);

        const c = kalyaBrown900;
        const c2 = kalyaOrange50;
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SfDataGrid(
              gridLinesVisibility: GridLinesVisibility.vertical,
              source: orderDataSource,
              columnWidthMode: ColumnWidthMode.fill,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'name',
                  label: const Header(
                    text: 'Item',
                    color: c,
                    textColor: c2,
                  ),
                ),
                GridColumn(
                  columnName: 'quantity',
                  label: const Header(
                    text: 'Quantity',
                    color: c,
                    textColor: c2,
                  ),
                ),
                GridColumn(
                  columnName: 'price',
                  label: const Header(
                    text: 'Price',
                    color: c,
                    textColor: c2,
                  ),
                ),
              ],
            ),
            Container(
              color: c,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Grand Total: ',
                    style: TextStyle(
                      color: c2,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      formatter.format(bagHive.totalCost),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: c2,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String text;
  final Color color, textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
      ),
    );
  }
}

class OrderDataSource extends DataGridSource {
  OrderDataSource({required List<BagItem> bagItems}) {
    _orderData = bagItems.map<DataGridRow>(
      (bagItem) {
        // print(bagItem.toString());
        return DataGridRow(
          cells: [
            DataGridCell<String>(
              columnName: 'name',
              value: bagItem.name,
            ),
            DataGridCell<int>(
              columnName: 'quantity',
              value: bagItem.qty,
            ),
            DataGridCell<String>(
              columnName: 'price',
              value: formatter.format(bagItem.price * bagItem.qty),
            ),
          ],
        );
      },
    ).toList();
  }

  List<DataGridRow> _orderData = [];

  @override
  List<DataGridRow> get rows => _orderData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = _orderData.indexOf(row);
    Color backgroundColor = Colors.transparent;

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>(
      (e) {
        return Consumer(
          builder: (context, watch, child) {
            const c = kalyaBrown900;
            if ((rowIndex % 2) == 0) {
              backgroundColor = kalyaOrange50;
            }
            return Container(
              color: backgroundColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.value.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: c,
                ),
              ),
            );
          },
        );
      },
    ).toList());
  }
}

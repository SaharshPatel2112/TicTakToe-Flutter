import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';

class PriceArea extends StatelessWidget {
  final String entryPrice;
  final String winningPrice;
  const PriceArea({
    super.key,
    required this.entryPrice,
    required this.winningPrice,
  });

  Widget _priceRow({
    required BuildContext context,
    required String label,
    required String price,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        SizedBox(width: 50),
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(width: 100),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsPath.coinIcon, width: 24, height: 24),
                SizedBox(width: 10),
                Text(
                  price,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _priceRow(
          context: context,
          label: 'Entry Price',
          price: entryPrice,
        ),
        SizedBox(height: 15),
        _priceRow(
          context: context,
          label: 'Winning Price',
          price: winningPrice,
        ),
      ],
    );
  }
}
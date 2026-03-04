import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../settings/currency_manager.dart';

class CurrencyBar extends StatelessWidget {
  const CurrencyBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currency = context.watch<CurrencyManager>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _coin(
          color: const Color(0xFFFFC107),
          amount: currency.gold,
        ),
        const SizedBox(width: 10),
        _coin(
          color: const Color(0xFFB0BEC5),
          amount: currency.silver,
        ),
      ],
    );
  }

  Widget _coin({
    required Color color,
    required int amount,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        amount.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
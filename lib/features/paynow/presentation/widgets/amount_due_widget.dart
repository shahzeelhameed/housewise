import 'package:flutter/material.dart';
import 'package:housewise/config/components/summary_card.dart';

class AmountDue extends StatelessWidget {
  const AmountDue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SummaryCard(
          title: "AMOUNT PAYABLE",
          label: "PKR",
          description: "10,709.00",
        ),
        Expanded(
          child: SummaryCard(
            title: "Due Date",
            label: "29th",
            description: "Apr-2025",
          ),
        )
      ],
    );
  }
}

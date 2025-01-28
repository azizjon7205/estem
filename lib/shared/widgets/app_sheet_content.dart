import 'package:flutter/material.dart';

class AppSheetContent extends StatelessWidget {
  const AppSheetContent({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
        minHeight: MediaQuery.of(context).size.height * 0.15,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(38),
          topRight: Radius.circular(38),
        ),
        child: Wrap(
          children: [
            Stack(
              children: [
                content,
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 6),
                    height: 4,
                    width: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB2B2B2).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

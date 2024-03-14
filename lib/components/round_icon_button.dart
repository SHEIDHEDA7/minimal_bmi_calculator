import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconD;
  final VoidCallback onTap;
  const RoundIconButton({
    required this.onTap,
    required this.iconD,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      shape: const CircleBorder(),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: const Color(0xFF4C4F5E),
      padding: const EdgeInsets.all(10),
      child: Icon(
        iconD,
        color: kDefaultIconLightColor,
      ),
    );
  }
}

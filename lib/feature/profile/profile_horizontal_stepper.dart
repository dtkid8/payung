import 'package:flutter/material.dart';

class ProfileHorizontalStepper extends StatelessWidget {
  final int step;
  final List<String> labels;
  final Function(int) onTap;
  const ProfileHorizontalStepper(
      {super.key,
      required this.step,
      this.labels = const [
        'Biodata Diri',
        'Alamat Pribadi',
        'Informasi Perusahaan',
      ],
      required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: labels
                  .map(
                    (e) => _buildStep(
                      context,
                      constraints,
                      stepNumber: (labels.indexOf(e) + 1),
                      label: e,
                      isCompleted: (labels.indexOf(e) + 1) <= step,
                      isFirst: 0 == (labels.indexOf(e)),
                      isLast: labels.length - 1 == (labels.indexOf(e)),
                      onTap: onTap,
                    ),
                  )
                  .toList());
        },
      ),
    );
  }

  Widget _buildStep(
    BuildContext context,
    BoxConstraints constraints, {
    required int stepNumber,
    required String label,
    required bool isCompleted,
    bool isFirst = false,
    bool isLast = false,
    required Function(int) onTap,
  }) {
    final double lineOpacity = isCompleted ? 1 : 0.3;
    final double paddingLeft = isFirst ? constraints.maxWidth * 0.2 : 0;
    final double paddingRight = isLast ? constraints.maxWidth * 0.2 : 0;

    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  left: paddingLeft,
                  right: paddingRight,
                  top: constraints.maxHeight * 0.18),
              child: Container(
                width: constraints.maxWidth,
                height: 2,
                color: Theme.of(context).primaryColor.withOpacity(lineOpacity),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(stepNumber);
            },
            child: _buildStepCircle(context, stepNumber),
          ),
          _buildStepLabel(context, constraints, label),
        ],
      ),
    );
  }

  Widget _buildStepCircle(BuildContext context, int stepNumber) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.all(14),
        child: Text(
          stepNumber.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildStepLabel(
    BuildContext context,
    BoxConstraints constraints,
    String label,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: constraints.maxHeight * 0.4),
        child: SizedBox(
          width: 70,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}

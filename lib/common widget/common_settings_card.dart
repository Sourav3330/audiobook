import 'package:audio_book/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonSettingsCard extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final Widget? trailing;

  const CommonSettingsCard({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.description,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          width: double.infinity,
          height:100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1, color: AppColors.gray500),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          leadingIcon,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.gray700),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  trailing ?? const SizedBox.shrink(),
                  SizedBox(width: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

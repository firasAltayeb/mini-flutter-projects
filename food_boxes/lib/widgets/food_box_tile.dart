import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../utility/box_list_notifier.dart';
import '../utility/dimension_extensions.dart';

class FoodBoxTile extends ConsumerStatefulWidget {
  const FoodBoxTile({
    super.key,
    required this.passedBox,
  });

  final FoodBox passedBox;

  @override
  ConsumerState<FoodBoxTile> createState() => _FoodBoxTileState();
}

class _FoodBoxTileState extends ConsumerState<FoodBoxTile> {
  late Color tileBgColor;

  @override
  void initState() {
    tileBgColor = AppConstants.grey500;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (ref
        .read(selectedBoxesProvider)
        .any((e) => e.id == widget.passedBox.id)) {
      tileBgColor = Theme.of(context).colorScheme.primary;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final boxQuantity = ref
        .watch(selectedBoxesProvider.notifier)
        .getNumberOfBoxes(widget.passedBox.id);
    return Card(
      color: boxQuantity <= 0 ? AppConstants.grey500 : tileBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.circleRadius,
      ),
      elevation: 0,
      child: Row(
        children: [
          InkWell(
            onTap: boxQuantity != 0
                ? null
                : () {
                    ref.read(selectedBoxesProvider.notifier).updateList(
                          widget.passedBox,
                        );
                    setState(
                      () => tileBgColor = Theme.of(context).colorScheme.primary,
                    );
                  },
            splashFactory: NoSplash.splashFactory,
            child: Container(
              height: context.percentHeight(14),
              width: context.percentWidth(78),
              padding: EdgeInsets.only(
                left: context.percentWidth(4.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.passedBox.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: context.percentWidth(78),
                      child: Text(
                        widget.passedBox.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: boxQuantity == AppConstants.maxBoxQuantity
                    ? null
                    : () {
                        if (boxQuantity == 0) {
                          setState(
                            () => tileBgColor =
                                Theme.of(context).colorScheme.primary,
                          );
                        }
                        ref.read(selectedBoxesProvider.notifier).updateList(
                              widget.passedBox,
                            );
                      },
                child: Icon(
                  Icons.add,
                  size: context.percentHeight(2.5),
                  color: Colors.white,
                ),
              ),
              Container(
                height: context.percentHeight(3),
                width: context.percentWidth(5),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: context.percentHeight(0.5),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  boxQuantity.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: context.percentHeight(2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: boxQuantity == 0
                    ? null
                    : () {
                        if (boxQuantity == 1) {
                          setState(() => tileBgColor = AppConstants.grey500);
                        }
                        if (boxQuantity >= 1) {
                          ref
                              .read(selectedBoxesProvider.notifier)
                              .removeBox(widget.passedBox);
                        }
                      },
                child: Icon(
                  Icons.remove,
                  size: context.percentHeight(2.5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

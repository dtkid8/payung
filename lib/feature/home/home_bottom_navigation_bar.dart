import 'package:flutter/material.dart';
import 'package:payung/feature/home/home_bottom_navigation_border_painter.dart';
import 'package:payung/feature/home/home_bottom_navigation_menu.dart';
import 'package:payung/core/widget/svg_asset.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final List<HomeBottomNavigationMenu> items;
  final Function(int) onTapMenu;
  const HomeBottomNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTapMenu,
  });

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  final _minSize = 0.12;
  final _maxSize = 0.3;
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  bool _isExpanded = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (!_isAnimating) {
        setState(() {
          _isExpanded = _controller.size >= (_maxSize - 0.05);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleSheet() {
    if (_isAnimating) return;

    setState(() {
      _isExpanded = !_isExpanded;
    });

    _isAnimating = true;

    _controller
        .animateTo(
          _isExpanded ? _maxSize : _minSize,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        )
        .whenComplete(() => _isAnimating = false);
  }

  void closeSheet() {
    setState(() {
      _isExpanded = false;
    });
    _isAnimating = true;
    _controller
        .animateTo(
          _isExpanded ? _maxSize : _minSize,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        )
        .whenComplete(() => _isAnimating = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Visibility(
          visible: _isExpanded,
          child: GestureDetector(
            onTap: closeSheet,
            child: AnimatedOpacity(
              opacity: _isExpanded ? 0.3 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                height: size.height,
                color: Colors.black,
              ),
            ),
          ),
        ),
        DraggableScrollableSheet(
          snap: true,
          controller: _controller,
          initialChildSize: _minSize,
          minChildSize: _minSize,
          maxChildSize: _maxSize,
          builder: (BuildContext context, ScrollController scrollController) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CustomPaint(
                    painter: HomeBottomNavigationBorderPainter(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 40,
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              closeSheet();
                              widget.onTapMenu(index);
                            },
                            customBorder: const CircleBorder(),
                            child: Column(
                              children: [
                                SvgAsset(
                                  icon: widget.items[index].icon,
                                  colorFilter: widget.selectedIndex == index
                                      ? ColorFilter.mode(
                                          Theme.of(context).primaryColor,
                                          BlendMode.srcIn,
                                        )
                                      : const ColorFilter.mode(
                                          Colors.black,
                                          BlendMode.srcIn,
                                        ),
                                ),
                                Text(
                                  widget.items[index].label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: widget.selectedIndex == index
                                            ? Theme.of(context).primaryColor
                                            : Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      onTap: toggleSheet,
                      child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

import 'package:todo_app/src/imports.dart';

class CusomSliverAppBar extends StatelessWidget {
  final bool _pinned;
  final bool _snap;
  final bool _floating;
  final double appBarHeight;
  final double minAppbarPadding;
  final double minAppbarBottomPadding;
  final int? countCompletedTask;
  final bool isShowColpletedTask;
  final VoidCallback showColpletedTask;

  const CusomSliverAppBar({
    Key? key,
    required bool pinned,
    required bool snap,
    required bool floating,
    required this.appBarHeight,
    required this.minAppbarPadding,
    required this.minAppbarBottomPadding,
    required this.showColpletedTask,
    this.countCompletedTask,
    required this.isShowColpletedTask,
  })  : _pinned = pinned,
        _snap = snap,
        _floating = floating,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return SliverAppBar(
      pinned: _pinned,
      snap: _snap,
      floating: _floating,
      expandedHeight: appBarHeight,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final percentage = (constraints.maxHeight - kToolbarHeight) /
              (appBarHeight - kToolbarHeight);
          final isCollapsed = percentage != 0.0;

          return Center(
            child: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsetsDirectional.only(
                start: minAppbarPadding + (44 * percentage),
                bottom: minAppbarBottomPadding + (20 * percentage),
              ),
              title: Row(
                children: [
                  Text(
                    appLocalizations.myTasks,
                    style: isCollapsed
                        ? Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 20 + (12 * percentage),
                              height: 1.6,
                            )
                        : Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  Material(
                    child: Visibility(
                      visible: !isCollapsed,
                      child: GestureDetector(
                        onTap: () {
                          showColpletedTask();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SvgPicture.asset(
                            AppIcons.visibilityOn,
                            width: 23,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              background: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 64, right: 24),
                  child: Row(
                    children: [
                      Text(
                        '${appLocalizations.done} - $countCompletedTask',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showColpletedTask();
                        },
                        icon: SvgPicture.asset(
                          !isShowColpletedTask
                              ? AppIcons.visibilityOn
                              : AppIcons.visibilityOff,
                          width: 23,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

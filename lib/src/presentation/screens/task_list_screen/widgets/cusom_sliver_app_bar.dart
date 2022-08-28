import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/screens/task_list_screen/widgets/toggle_completed_task_btn.dart';

class CusomSliverAppBar extends StatefulWidget {
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
  State<CusomSliverAppBar> createState() => _CusomSliverAppBarState();
}

class _CusomSliverAppBarState extends State<CusomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return SliverAppBar(
      pinned: widget._pinned,
      snap: widget._snap,
      floating: widget._floating,
      expandedHeight: widget.appBarHeight,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final percentage = (constraints.maxHeight - kToolbarHeight) /
              (widget.appBarHeight - kToolbarHeight);
          final isCollapsed = percentage != 0.0;

          return Center(
            child: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsetsDirectional.only(
                start: widget.minAppbarPadding + (44 * percentage),
                bottom: widget.minAppbarBottomPadding + (20 * percentage),
              ),
              title: Row(
                children: [
                  Text(
                    appLocalizations.myTasks,
                    style: isCollapsed
                        ? Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 20 + (12 * percentage),
                              height: 1.6,
                            )
                        : Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  Visibility(
                    visible: !isCollapsed,
                    child: GestureDetector(
                      onTap: () {
                        widget.showColpletedTask();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: SizedBox(
                          width: 24,
                          child: ToggleCompletedTaskBtn(
                            isShowColpletedTask: widget.isShowColpletedTask,
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
                        '${appLocalizations.done} - ${widget.countCompletedTask}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          widget.showColpletedTask();
                        },
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: ToggleCompletedTaskBtn(
                            isShowColpletedTask: widget.isShowColpletedTask,
                          ),
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

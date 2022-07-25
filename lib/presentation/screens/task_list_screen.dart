import 'package:todo_app/imports.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final _pinned = true;
  final _snap = false;
  final _floating = false;

  final appBarHeight = 150.0;
  double minAppbarPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read<NavigationController>()
            .navigateTo(RouteConstant.addTask),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            CusomSliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              appBarHeight: appBarHeight,
              minAppbarPadding: minAppbarPadding,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => context
                          .read<NavigationController>()
                          .navigateTo(RouteConstant.addTask),
                      child: Dismissible(
                        key: Key(index.toString()),
                        onDismissed: (DismissDirection direction) {},
                        background: Container(
                          padding: const EdgeInsets.only(left: 24),
                          alignment: Alignment.centerLeft,
                          color: customColors.green,
                          child: SvgPicture.asset(
                            AppIcons.check,
                            color: customColors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                          padding: const EdgeInsets.only(right: 24),
                          alignment: Alignment.centerRight,
                          color: customColors.red,
                          child: SvgPicture.asset(
                            AppIcons.delete,
                            color: customColors.white,
                          ),
                        ),
                        child: Container(
                          height: 48.0,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (_) {}),
                              const SizedBox(width: 15),
                              Text(
                                'Купить что-то',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  AppIcons.infoOutline,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 19,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 60,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 48,
                      child: Row(
                        children: [
                          const SizedBox(width: 67),
                          Text(
                            appLocalizations.addNewTask,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CusomSliverAppBar extends StatelessWidget {
  const CusomSliverAppBar({
    Key? key,
    required bool pinned,
    required bool snap,
    required bool floating,
    required this.appBarHeight,
    required this.minAppbarPadding,
  })  : _pinned = pinned,
        _snap = snap,
        _floating = floating,
        super(key: key);

  final bool _pinned;
  final bool _snap;
  final bool _floating;
  final double appBarHeight;
  final double minAppbarPadding;

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
                bottom: 16,
              ),
              title: Row(
                children: [
                  Text(
                    appLocalizations.myTasks,
                    style: isCollapsed
                        ? Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20 + (12 * percentage), height: 1.6)
                        : Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  Visibility(
                    visible: !isCollapsed,
                    child: GestureDetector(
                      onTap: () {},
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
                ],
              ),
              background: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 64, right: 24),
                  child: Row(
                    children: [
                      Text(
                        '${appLocalizations.done} - 5',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AppIcons.visibilityOn,
                        width: 23,
                        height: 15,
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

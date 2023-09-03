import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageWrapperComponent extends StatefulWidget {
  PageWrapperComponent({
    super.key,
    required this.childComponent,
    this.title,
    this.hasAppBar = true,
    this.onWillPopupBehavior = false,
    this.appBar,
  });

  Widget childComponent;
  String? title;
  bool hasAppBar;
  PreferredSizeWidget? appBar;
  bool onWillPopupBehavior;

  @override
  State<PageWrapperComponent> createState() => _PageWrapperComponentState();
}

class _PageWrapperComponentState extends State<PageWrapperComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.onWillPopupBehavior
        ? WillPopScope(
            onWillPop: () {
              showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      title: const Text('Deseja sair do aplicativo?'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: const Text('Sim')),
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Não')),
                      ],
                    )),
              );

              return Future.value(true);
            },
            child: Scaffold(
              appBar: widget.appBar,
              body: Container(
                child: widget.childComponent,
              ),
            ),
          )
        : Scaffold(
            appBar: widget.appBar,
            body: Container(
              child: widget.childComponent,
            ),
          );
  }
}

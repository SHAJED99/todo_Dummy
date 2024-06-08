import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_process_button_widget/on_process_button_widget.dart';
import 'package:todo_bloc/components.dart';

class DevScaffold extends StatefulWidget {
  const DevScaffold({super.key, required this.child, this.floatingActionButton});
  final Widget child;
  final Widget? floatingActionButton;

  @override
  State<DevScaffold> createState() => _DevScaffoldState();
}

class _DevScaffoldState extends State<DevScaffold> {
  Widget _onPress(String text, Function onTap) {
    return OnProcessButtonWidget(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
      onDone: (isSuccess) => onTap(),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return Scaffold(
        body: widget.child,
        floatingActionButton: widget.floatingActionButton,
        endDrawer: Container(
          padding: const EdgeInsets.all(defaultPadding),
          margin: const EdgeInsets.only(left: defaultBoxHeight),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              // _onPress("Change Theme - System Local", () => _controller.changeTheme()),
              // _onPress("Change Theme - Dark Local", () => _controller.changeTheme(isDarkMode: true)),
              // _onPress("Change Theme - Light Local", () => _controller.changeTheme(isDarkMode: false)),
              // _onPress("Logout", () => _controller.logout()),
            ],
          ),
        ),
      );
    }

    return widget.child;
  }
}

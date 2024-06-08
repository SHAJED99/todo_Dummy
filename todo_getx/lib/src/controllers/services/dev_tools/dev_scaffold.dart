import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:on_process_button_widget/on_process_button_widget.dart';
import 'package:todo_getx/components.dart';
import 'package:todo_getx/src/controllers/data_controllers/data_controller.dart';

class DevScaffold extends StatelessWidget {
  DevScaffold({super.key, required this.child, this.floatingActionButton});
  final Widget child;
  final Widget? floatingActionButton;

  final DataController _controller = Get.find();

  Widget _onPress(String text, Function onTap) {
    return OnProcessButtonWidget(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 4),
      onDone: (isSuccess) => onTap(),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return Scaffold(
        body: child,
        floatingActionButton: floatingActionButton,
        endDrawer: Container(
          padding: EdgeInsets.all(defaultPadding),
          margin: EdgeInsets.only(left: defaultBoxHeight),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              _onPress("Change Theme - System Local", () => _controller.changeTheme()),
              _onPress("Change Theme - Dark Local", () => _controller.changeTheme(isDarkMode: true)),
              _onPress("Change Theme - Light Local", () => _controller.changeTheme(isDarkMode: false)),
              _onPress("Logout", () => _controller.logout()),
            ],
          ),
        ),
      );
    }

    return child;
  }
}

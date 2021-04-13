import 'package:get/get.dart';

class NavigationController extends GetxController {
  var serverName = "My".obs;

  final _selectedTab = 0.obs;
  get selectedTab => this._selectedTab.value;
  set selectedTab(index) => this._selectedTab.value = index;
}

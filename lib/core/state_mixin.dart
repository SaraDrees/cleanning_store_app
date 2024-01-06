import 'package:cleanning_store_app/core/request_mixin.dart';
import 'package:cleanning_store_app/core/widget_state_widget.dart';
import 'package:get/get.dart';

mixin StateProvider on GetxController {
  void updateState(List<String> ids, WidgetState newState) {
    for (String id in ids) {
      for (StateHolder stateHolder in StateBuilder.stateList) {
        if (id == stateHolder.id) {
          stateHolder.widgetState = newState;
        }
      }
    }
    update(ids);
  }

  WidgetState? getWidgetState(String id) {
    for (StateHolder stateHolder in StateBuilder.stateList) {
      if (id == stateHolder.id) {
        return stateHolder.widgetState;
      }
    }
    return null;
  }
}

abstract class GetxStateController<T> extends GetxController
    with StateMixin<T>, StateProvider, RequestMixin {}

import 'package:flutter/material.dart';

class Cardprovider extends ChangeNotifier {
  bool _isDragging = false;

  Offset _position = Offset.zero;
  Offset get position => _position;

  bool get isDragging => _isDragging;
  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragStartDetails details) {
    _position += details.globalPosition;
    notifyListeners();
  }

  void endPosition() {
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    notifyListeners();
  }
}

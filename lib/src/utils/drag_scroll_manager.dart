import 'package:flutter/material.dart';

class DragScrollManager {
  DragScrollManager._();
  static final instance = DragScrollManager._();

  ScrollController? _controller;
  bool _dragging = false;

  void attach(ScrollController controller) {
    _controller = controller;
  }

  void start() => _dragging = true;
  void stop() => _dragging = false;

  void update(Offset globalPosition, BuildContext context) {
    if (!_dragging || _controller == null) return;

    final screenWidth = MediaQuery.of(context).size.width;
    const edgeThreshold = 80;
    const scrollSpeed = 12;

    if (globalPosition.dx < edgeThreshold) {
      _controller!.jumpTo(
        (_controller!.offset - scrollSpeed).clamp(
          0.0,
          _controller!.position.maxScrollExtent,
        ),
      );
    } else if (globalPosition.dx > screenWidth - edgeThreshold) {
      _controller!.jumpTo(
        (_controller!.offset + scrollSpeed).clamp(
          0.0,
          _controller!.position.maxScrollExtent,
        ),
      );
    }
  }
}

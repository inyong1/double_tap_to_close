import 'dart:async';

import 'package:flutter/material.dart';

class SeconPage extends StatefulWidget {
  const SeconPage({super.key});

  @override
  State<SeconPage> createState() => _SeconPageState();
}

class _SeconPageState extends State<SeconPage> {
  String _text = "Press back button to close";
  bool _waitingSecondTap = false;
  Timer? _timer;

  void _onPopInvokedWithResult(bool didPop, result) {
    if (didPop) {
      /// means the page already closed
      /// nothing to do here
      return;
    }

    if (_waitingSecondTap) {
      /// close the page
      Navigator.pop(context);
    } else {
      _startWaitingTimer();
    }
  }

  void _startWaitingTimer() {
    setState(() {
      _waitingSecondTap = true;
      _text = "Press back button again to close the page";
    });
    _timer?.cancel();
    _timer = Timer(Durations.extralong4, () {
      if (mounted) {
        setState(() {
          _waitingSecondTap = false;
          _text = "Press back button";
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: _onPopInvokedWithResult,
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PopScop Example"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_text),
              Container(
                alignment: Alignment.centerLeft,
                width: 200,
                child: AnimatedContainer(
                  width: _waitingSecondTap ? 0 : 200,
                  height: 5,
                  color: Colors.green,
                  duration: Duration(seconds: _waitingSecondTap ? 1 : 0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

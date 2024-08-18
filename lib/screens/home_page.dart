import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isX = true;
  final List<String> _items = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _handleTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                border: Border.all(
                  color: theme.colorScheme.surfaceContainerHighest,
                ),
              ),
              child: Center(
                child: Icon(
                  _items[index] == "x"
                      ? Icons.close_outlined
                      : _items[index] == "o"
                          ? Icons.circle_outlined
                          : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _handleTap(int index) {
    setState(() {
      if (_items[index].isEmpty) {
        _items[index] = isX ? "x" : "o";
        isX = !isX;
      }
    });

    _checkWinner();
  }

  _checkWinner() {
    String? winner;

    // Check first row
    if (_items[0] == _items[1] &&
        _items[0] == _items[2] &&
        _items[0].isNotEmpty) {
      winner = _items[0];
    }

    // Check second row
    if (_items[3] == _items[4] &&
        _items[3] == _items[5] &&
        _items[3].isNotEmpty) {
      winner = _items[3];
    }

    // Check third row
    if (_items[6] == _items[7] &&
        _items[6] == _items[8] &&
        _items[6].isNotEmpty) {
      winner = _items[6];
    }

    // Check first column
    if (_items[0] == _items[3] &&
        _items[0] == _items[6] &&
        _items[0].isNotEmpty) {
      winner = _items[0];
    }

    // Check second column
    if (_items[1] == _items[4] &&
        _items[1] == _items[7] &&
        _items[1].isNotEmpty) {
      winner = _items[1];
    }

    // Check third column
    if (_items[2] == _items[5] &&
        _items[2] == _items[8] &&
        _items[2].isNotEmpty) {
      winner = _items[2];
    }

    // Check first diagonal
    if (_items[0] == _items[4] &&
        _items[0] == _items[8] &&
        _items[0].isNotEmpty) {
      winner = _items[0];
    }

    // Check second diagonal
    if (_items[2] == _items[4] &&
        _items[2] == _items[6] &&
        _items[2].isNotEmpty) {
      winner = _items[2];
    }

    if (winner != null) {
      _showDialog(winner);
      _items.fillRange(0, 9, "");
    } else if (!_items.contains("")) {
      _showDialog("Draw");
      _items.fillRange(0, 9, "");
    }
  }

  _showDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Winner: $winner"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
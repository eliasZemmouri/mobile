import 'package:flutter/material.dart';

class TachesPage extends StatefulWidget {
  @override
  _TachesPageState createState() => _TachesPageState();
}

class _TachesPageState extends State<TachesPage> {
  List<String> _options = ['Restaurants', 'Supermarchés', 'Logements', 'Divertissements'];
  List<String> _selectedOptions = [];
  bool _isSelectionConfirmed = false;

  void _toggleOption(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  void _confirmSelection() {
    setState(() {
      _isSelectionConfirmed = true;
    });
  }

  void _resetSelection() {
    setState(() {
      _selectedOptions.clear();
      _isSelectionConfirmed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tâches'),
      ),
      body: Column(
        children: [
          // Notifications for selected options
          if (_isSelectionConfirmed && _selectedOptions.isNotEmpty)
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8.0,
                        children: _selectedOptions.map((option) {
                          return Chip(
                            label: Text(option),
                          );
                        }).toList(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: _resetSelection,
                    ),
                  ],
                ),
              ),
            ),
          if (!_isSelectionConfirmed)
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: _options.map((option) {
                            return CheckboxListTile(
                              title: Text(option),
                              value: _selectedOptions.contains(option),
                              onChanged: (bool? value) {
                                _toggleOption(option);
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _selectedOptions.isNotEmpty ? _confirmSelection : null,
                          child: Text('Confirmer'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

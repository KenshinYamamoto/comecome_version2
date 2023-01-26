import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:painter/painter.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../models/select_color_model.dart';
import './home_screen.dart';

class MemoScreen extends StatefulWidget {
  static const routeName = '/memo';
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  bool _finished = false;
  PainterController _controller = _newController();

  @override
  void initState() {
    super.initState();
  }

  static PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  void _show(PictureDetails picture, BuildContext context) {
    setState(() {
      _finished = true;
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('View your image'),
        ),
        body: Container(
            alignment: Alignment.center,
            child: FutureBuilder<Uint8List>(
              future: picture.toPNG(),
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Image.memory(snapshot.data!);
                    }
                  default:
                    return FractionallySizedBox(
                      widthFactor: 0.1,
                      child: AspectRatio(
                          aspectRatio: 1.0, child: CircularProgressIndicator()),
                      alignment: Alignment.center,
                    );
                }
              },
            )),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    Widget generateOptionCard(String text, VoidCallback tapFunction) {
      return SizedBox(
        height: deviceHeight * 0.08,
        width: deviceHeight * 0.08,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () => tapFunction(),
            onLongPress: () => tapFunction(),
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.abc),
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: deviceWidth * 0.03,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    List<Widget> actions;
    if (_finished) {
      actions = [
        IconButton(
          icon: const Icon(Icons.content_copy),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = _newController();
          }),
        ),
      ];
    } else {
      actions = [
        IconButton(
          icon: const Icon(
            Icons.undo,
          ),
          tooltip: 'Undo',
          onPressed: () {
            if (_controller.isEmpty) {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) =>
                    const Text('Nothing to undo'),
              );
            } else {
              _controller.undo();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: 'Clear',
          onPressed: _controller.clear,
        ),
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: () => _show(_controller.finish(), context),
        ),
      ];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter Example'),
        // actions: actions,
        // bottom: PreferredSize(
        //   child: DrawBar(_controller),
        //   preferredSize: Size(MediaQuery.of(context).size.width, 30.0),
        // ),
      ),
      body: Container(
        color: Colors.deepOrange[300],
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.77,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Painter(_controller),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.1,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < SelectColorModel.colors.length;
                        i++) ...{
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _controller.drawColor =
                                  SelectColorModel.colors[i];
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              _controller.drawColor =
                                  SelectColorModel.colors[i];
                            });
                          },
                          child: Container(
                            height: deviceHeight * 0.1,
                            width: deviceHeight * 0.1,
                            color: SelectColorModel.colors[i],
                            child: Icon(
                              _controller.drawColor ==
                                      SelectColorModel.colors[i]
                                  ? Icons.check
                                  : null,
                              color: Colors.white,
                              size: deviceHeight * 0.07,
                            ),
                          ),
                        ),
                      ),
                    }
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.1,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      generateOptionCard('細い', () {
                        setState(() {
                          _controller.thickness = 5;
                        });
                      }),
                      generateOptionCard('太い', () {
                        setState(() {
                          _controller.thickness = 15;
                        });
                      }),
                      generateOptionCard('戻す', () {
                        if (_controller.isEmpty) return;
                        _controller.undo();
                      }),
                      generateOptionCard('全消し', () => _controller.clear()),
                      generateOptionCard('消ゴム', () {
                        setState(() {
                          _controller.drawColor = Colors.white;
                        });
                      }),
                      SizedBox(
                        height: deviceHeight * 0.1,
                        width: deviceWidth * 0.4,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.routeName,
                              (route) => false,
                            ),
                            onLongPress: () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.routeName,
                              (route) => false,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.abc), // TODO 画像の表示
                                  FittedBox(
                                    child: Text(
                                      'トップ',
                                      style: TextStyle(
                                        fontSize: deviceHeight * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.03,
              color: Colors.deepOrange[300],
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                  child: Text(
                    'produced by comecome',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawBar extends StatelessWidget {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Slider(
            value: _controller.thickness,
            onChanged: (double value) => setState(() {
              _controller.thickness = value;
            }),
            min: 1.0,
            max: 20.0,
            activeColor: Colors.white,
          );
        })),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return RotatedBox(
              quarterTurns: _controller.eraseMode ? 2 : 0,
              child: IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: (_controller.eraseMode ? 'Disable' : 'Enable') +
                      ' eraser',
                  onPressed: () {
                    setState(() {
                      _controller.eraseMode = !_controller.eraseMode;
                    });
                  }));
        }),
        ColorPickerButton(_controller, false),
        ColorPickerButton(_controller, true),
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;

  ColorPickerButton(this._controller, this._background);

  @override
  _ColorPickerButtonState createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_iconData, color: _color),
      tooltip:
          widget._background ? 'Change background color' : 'Change draw color',
      onPressed: _pickColor,
    );
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Pick color'),
                  ),
                  body: Container(
                      alignment: Alignment.center,
                      child: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: (Color c) => pickerColor = c,
                      )));
            }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._background
      ? widget._controller.backgroundColor
      : widget._controller.drawColor;

  IconData get _iconData =>
      widget._background ? Icons.format_color_fill : Icons.brush;

  set _color(Color color) {
    if (widget._background) {
      widget._controller.backgroundColor = color;
    } else {
      widget._controller.drawColor = color;
    }
  }
}

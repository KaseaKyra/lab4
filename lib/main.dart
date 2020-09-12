import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Color _color = Colors.blue;

  /* 2. Insert image */
  Widget getImageSection() {
    return Image.asset('images/1.jpg',
        width: 600, height: 240, fit: BoxFit.cover);
  }

  /* 3. insert title */
  Widget getTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen lake campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'kanderstef, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
          ShareAlert(),
        ],
      ),
    );
  }

  /* insert buttons ,*/
  Widget getButtonSection() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(_color, Icons.add_circle, 'ADD'),
          _buildButtonColumn(_color, Icons.messenger, 'MESSENGER'),
          _buildButtonColumn(_color, Icons.notifications, 'NOTIFICATIONS'),
          _buildButtonColumn(_color, Icons.arrow_drop_down_circle, 'MORE'),
        ],
      ),
    );
  }

  /* insert text */
  Widget getTextSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run',
        softWrap: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo layout'),
        ),
        body: Column(
          children: [
            getImageSection(),
            getTitleSection(),
            getButtonSection(),
            getTextSection(),
          ],
        ));
  }
}

/* Interactive Button */
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>
    with SingleTickerProviderStateMixin {
  int _favoriteCount = 1;

  void _toggleFavorite() {
    setState(() {
      _favoriteCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: Icon(Icons.favorite),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

class ShareAlert extends StatefulWidget {
  @override
  _ShareAlertState createState() => _ShareAlertState();
}

class _ShareAlertState extends State<ShareAlert>
    with SingleTickerProviderStateMixin {
  int _shareCount = 0;

  void increaseShareCount() {
    setState(() {
      _shareCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget closeButton = FlatButton(
      child: Text('Close'),
      onPressed: () {
        increaseShareCount();
        Navigator.of(context).pop();
      },
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          color: Colors.red[500],
          padding: EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          onPressed: () =>
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      title: Text('Thank for sharing!'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Lorem ipsum dolor sit amet, consectetur'),
                          ],
                        ),
                      ),
                      actions: [
                        closeButton,
                      ],
                    ),
              ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_shareCount'),
          ),
        ),
      ],
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

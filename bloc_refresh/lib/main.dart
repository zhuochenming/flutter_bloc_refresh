import 'package:bloc_refresh/all_refresh_cubit.dart';
import 'package:bloc_refresh/part_refresh_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '刷新机制'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AllRefreshCubit allCubit;
  late PartRefreshCubit partCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AllRefreshCubit()..init(context)),
          BlocProvider(create: (context) => PartRefreshCubit()),
        ],
        child: BlocBuilder<AllRefreshCubit, AllRefreshState>(
            builder: (context, state) {
          allCubit = BlocProvider.of<AllRefreshCubit>(context);
          partCubit = BlocProvider.of<PartRefreshCubit>(context);

          return bodyWidget();
        }));
  }

  Widget bodyWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<PartRefreshCubit, PartRefreshState>(
                builder: (context, state) {
              return Column(
                children: [Text('（局部刷新）本地的数据是：${partCubit.state.count}')],
              );
            }),
            Text(
              '${partCubit.state.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30),
            Text('（全局刷新）本地的数据是：${allCubit.state.count}'),
            Text(
              '${allCubit.state.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.blue,
                    child: const Text('全局刷新',
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                    onPressed: () {
                      allCubit.addOne();
                    }),
                const SizedBox(width: 30),
                MaterialButton(
                    color: Colors.blue,
                    child: const Text('局部刷新',
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                    onPressed: () {
                      partCubit.addTwo();
                    }),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

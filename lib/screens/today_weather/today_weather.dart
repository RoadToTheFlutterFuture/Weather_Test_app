import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:weather_test_app/constants/icons/icons.dart';
import 'package:weather_test_app/screens/today_weather/cubit/today_weather_cubit.dart';
import 'package:weather_test_app/screens/today_weather/views/bigIcon_weather/bigIcon_weather.dart';
import 'package:weather_test_app/screens/today_weather/views/parameters_weather/parameters_weather.dart';
import 'package:weather_test_app/widgets/decoretion_line.dart';
import 'package:weather_test_app/widgets/weather_bottomNavigationBar/weather_bottomNavigationBar.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodayWeatherCubit(context.read<WeatherRepository>()),
        child: BlocBuilder<TodayWeatherCubit, TodayWeatherState>(
            builder: (context, state) {
                if(state.status == TodayWeatherStatus.gettingWeather) {
                    context.read<TodayWeatherCubit>().fetchWeather();
                }
                return Scaffold(
                    appBar: AppBar(
                        centerTitle: true,
                        title: Text('Today'), //TODO: translate it | Today
                    ),
                    bottomNavigationBar: WeatherBottomNavigationBar(),
                    body: state.status == TodayWeatherStatus.gettingWeather ?
                        Center(child: SpinKitThreeBounce(color: Colors.grey,),) :
                        Column(
                            children: [
                                Flexible(
                                    flex: 3,
                                    child: BigIconWeather(
                                        cityTitle: state.repository!.cityTitle,
                                        tempTitle: state.repository!.tempTitle,
                                        bigIcon: weatherDecoration[state.repository!.bigIcon],
                                    ),
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            DecorationLine(
                                                bottom: 0,
                                            ),
                                            ParametersWeather(
                                                humidity: state.repository!.humidity,
                                                precipitationVolume: state.repository!.precipitations,
                                                pressure: state.repository!.pressure,
                                                windSpeed: state.repository!.windSpeed,
                                                windDirection: state.repository!.windDirection,
                                            ),
                                            DecorationLine(
                                                top: 0,
                                            )
                                        ],
                                    )
                                ),
                                Flexible(
                                    flex: 1,
                                    child: Center(
                                        child: TextButton(
                                            onPressed: () {
                                                print('click');
                                                context.read<TodayWeatherCubit>().shareWeatherText();
                                            },
                                        child: Text('Share'), //TODO: translate it | Share
                                        ),
                                    )),
                             ],
                        ),
                );
            },
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_test_app/screens/forecast/cubit/forecast_cubit.dart';
import 'package:weather_test_app/screens/forecast/views/dailyWeather_silverList.dart';
import 'package:weather_test_app/screens/forecast/views/weatherDate_silverAppBar.dart';
import 'package:weather_test_app/services/data_models/data_models.dart';
import 'package:weather_test_app/services/weather_repository/weather_repository.dart';

class Forecast extends StatelessWidget {
    const Forecast({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
            create: (context) => ForecastCubit(context.read<WeatherRepository>()),
            child: BlocBuilder<ForecastCubit, ForecastState>(
                builder: (context, state) {
                    if(state.status == ForecastStateStatus.initial) {
                        context.read<ForecastCubit>().fetchWeather();
                    }

                    return state.status == ForecastStateStatus.loaded ?
                        RefreshIndicator(
                            onRefresh: () => context.read<ForecastCubit>().updateWeather(),
                            child: CustomScrollView(slivers: _getSilvers(repository: state.repository!)),
                        ) : 
                        Center(child: SpinKitThreeBounce(color: Colors.grey,),);
                },
            ),
        );
    }

    List<Widget> _getSilvers({required FiveDayWeather repository}) {
        final List<Widget> silvers = [];

        final List data = repository.fiveDay!;

        data.forEach((item) {
            final String weekDay = item.first;
            final List dayWeather = item.last;

            if(weekDay == 'Today') {
                silvers.addAll([
                    WeatherDateSilverAppBar(status: true, title: weekDay),
                    DailyWeatherSilverList(data: dayWeather)
                ]);
            } else {
                silvers.addAll([
                    WeatherDateSilverAppBar(title: weekDay),
                    DailyWeatherSilverList(data: dayWeather)
                ]);
            }
        });

        return silvers;
    }
}

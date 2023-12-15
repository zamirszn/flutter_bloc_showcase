import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_showcase/bloc/weather_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData getWeatherImage(weatherType) {
    switch (weatherType) {
      // cloudy weathers start here
      case "01d":
        {
          return Icons.cloud;
        }
      case "01n":
        {
          return Icons.cloud;
        }
      case "02d":
        {
          return Icons.cloud;
        }
      case "02n":
        {
          return Icons.cloud;
        }
      case "03d":
        {
          return Icons.cloud_outlined;
        }
      case "03n":
        {
          return Icons.cloud;
        }
      case "04d":
        {
          return Icons.cloud_outlined;
        }
      case "04n":
        {
          return Icons.cloud;
        }
      case "09d":
        {
          return Icons.cloudy_snowing;
        }
      case "09n":
        {
          return Icons.cloudy_snowing;
        }
      case "10d":
        {
          return Icons.cloudy_snowing;
        }
      case "10n":
        {
          return Icons.cloudy_snowing;
        }
      case "11d":
        {
          return Icons.thunderstorm;
        }
      case "11n":
        {
          return Icons.thunderstorm;
        }
      case "13d":
        {
          return Icons.sunny_snowing;
        }
      case "13n":
        {
          return Icons.sunny_snowing;
        }
      case "50d":
        {
          return Icons.water_drop;
        }
      case "50n":
        {
          return Icons.water_drop;
        }

      default:
        {
          return Icons.error;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple,
                  ),
                  height: 300,
                  width: 300,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                  height: 300,
                  width: 300,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  height: 300,
                  width: 600,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.weather.areaName ?? "",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          const Text(
                            "Good morning",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),

                          Icon(
                            getWeatherImage(
                              state.weather.weatherIcon,
                            ),
                            size: 200,
                            color: Colors.white,
                          ),

                          // Image here

                          //
                          Text(
                            "${state.weather.temperature?.celsius?.round() ?? ""} C",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain?.toUpperCase() ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            DateFormat("EEEE dd .")
                                .add_jm()
                                .format(state.weather.date ?? DateTime.now()),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),

                          // here
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

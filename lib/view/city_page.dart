import 'package:flutter/material.dart';
import 'package:sky_vision/components/app_bar.dart';
import 'package:sky_vision/model/city.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        City.instance.getName(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${City.instance.getTemperature()}°C',
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      Text(
                          '${City.instance.getDate()} - ${City.instance.getHour()}'),
                      Text(
                        City.instance.getDescription(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: City.instance.getForecasts().length,
              itemBuilder: (context, int index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Data: ${City.instance.getForecasts()[index].getDate()} - ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              City.instance
                                  .getForecasts()[index]
                                  .getDescription(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Máx: ${City.instance.getForecasts()[index].getMaxTemp()}°C - ',
                            ),
                            Text(
                              'Min: ${City.instance.getForecasts()[index].getMinTemp()}°C',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

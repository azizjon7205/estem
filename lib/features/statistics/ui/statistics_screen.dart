import 'package:auto_route/annotations.dart';
import 'package:estem/features/statistics/bloc/statistics_bloc.dart';
import 'package:estem/features/statistics/bloc/statistics_event.dart';
import 'package:estem/features/statistics/bloc/statistics_state.dart';
import 'package:estem/features/statistics/ui/widgets/statistics_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class StatisticsScreen extends StatelessWidget{
  const StatisticsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => StatisticsBloc()..add(LoadStatistics()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Statistics',
            style: GoogleFonts.inter(fontSize: 24,  fontWeight: FontWeight.w500),
          ),
          leading: const BackButton(),
        ),
        body: BlocBuilder<StatisticsBloc, StatisticsState>(
            builder: (context, state){
              if(state is StatisticsLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(state is StatisticsLoaded){
                return StatisticsContent(state: state);
              } else{
                return Text('Information not found', style: GoogleFonts.inter(fontSize: 28),);
              }
            }
        ),
      ),
    );
  }
}
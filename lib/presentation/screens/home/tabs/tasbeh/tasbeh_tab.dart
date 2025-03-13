
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_c13_offline/core/resources/assets_manager.dart';
import 'package:islami_c13_offline/core/resources/colors_manager.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter=0;
  late String currentTasbeeh=tasbeehList[0];
  List<String> tasbeehList=["سبحان الله","الحمد لله","الله وأكبر"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetImages.SebhaBackground),
            fit: BoxFit.cover
        ),
      ),
      child: Column(
        children: [
          Image.asset(AssetImages.islamiLogo),
          const Text("سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى", style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color:ColorsManager.white
          ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                _updateSebha();
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    AssetImages.SebhaHead,
                    height: MediaQuery.of(context).size.height*0.12,
                    width: double.infinity,
                    //fit: BoxFit.fitWidth,
                  ),
                  Positioned.fill(
                    bottom: MediaQuery.of(context).size.height*0.02,
                      //top: MediaQuery.of(context).size.height*0.02,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 100),
                        turns: -counter*pi,
                        alignment: Alignment.center,
                        child: Image.asset(
                          AssetImages.SebhaBody,
                          //width: double.infinity,
                          //fit: BoxFit.contain,
                        ),
                      )
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(currentTasbeeh, style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color:ColorsManager.white
                      ),
                      ),
                      Text(counter.toString(), style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color:ColorsManager.white
                      ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          )

      ],
    ),
    );
  }

  void _updateSebha() {
    counter++;
    if(counter==34){
      currentTasbeeh=tasbeehList[(tasbeehList.indexOf(currentTasbeeh)+1)%3];
      counter=0;
    }
    setState(() {
    });

  }
}

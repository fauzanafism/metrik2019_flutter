import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/ui/soal.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

class GuidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text("Guidance", style: whiteTextMont.copyWith(fontSize: 16, color: Colors.black),),
            Text("Babak Penyisihan", style: whiteTextMont.copyWith(fontSize: 19, color: Colors.black),),
            Spacer(),
            Row(
              children: [Text('•',), Text(' Terdapat total 75 soal', style: whiteTextMont.copyWith(color: Colors.black),)],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('•'),
                Column(
                  children: [
                    Text('+2 poin jika jawaban benar', style: whiteTextMont.copyWith(color: Colors.black)),
                    Text('-1 poin jika jawaban salah', style: whiteTextMont.copyWith(color: Colors.black)),
                    Text('+0 poin jika jawaban kosong', style: whiteTextMont.copyWith(color: Colors.black)),
                  ],
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text('•'),
                Text(' Total waktu pengerjaan soal 100 menit', style: whiteTextMont.copyWith(color: Colors.black))
              ],
            ),
            Spacer(),
            GradientButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SoalPage();
              }));
            }, text: 'Next'),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

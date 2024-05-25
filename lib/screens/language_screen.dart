import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key,  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Expanded(child: Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: SizedBox(
                      width:MediaQuery.of(context).size.width,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                      Center(child: Image.asset('assets/images/image.png', width: 400,)),
                      const SizedBox(height: 5),
                      const Center(child: Text('Final Year Project', style: TextStyle(color: Colors.white),),),
                      const SizedBox(height: 70,),

                      const Padding(padding: EdgeInsets.symmetric(horizontal:10),
                      child: Text('select_language'),
                      ),
                      const SizedBox(height: 10,),

                      GridView.builder(
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1,
                        ) , 
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,  index) => const SizedBox(width: 300, height: 300,),
                        /*LanguageWidget(
                          languageModel:LocalizationController.languages[index],
                          LocalizationController: LocalizationController, index:index
                        )*/
                        ),
                        const SizedBox(height: 10,),
                        const Text('you_can_change_language')
                      ],
                      ),
                    ),
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
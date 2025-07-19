import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam/tabs/hadeth/hadeth.dart';
import 'package:islam/uitls/color.dart';
import 'package:islam/uitls/routeNames.dart';
import 'package:islam/widget/loadingindicator.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadeth();
    }
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).pushNamed(AppRoute.hadethDetails, arguments: hadeth),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.primaryColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadeth_left_top.png',
                    height: screenHeight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        style: textTheme.headlineSmall!.copyWith(
                          color: AppColor.blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadeth_right_top.png',
                    height: screenHeight * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hadeth_card_back.png'),
                  ),
                ),
                child: hadeth == null
                    ? Loadingindicator(color: AppColor.blackColor)
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (_, index) => Text(
                          hadeth!.content[index],
                          style: textTheme.titleLarge!.copyWith(
                            color: AppColor.blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        separatorBuilder: (_, __) => SizedBox(height: 5),
                        itemCount: hadeth!.content.length,
                      ),
              ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContent = await rootBundle.loadString(
      'assets/text/h${widget.index + 1}.txt',
    );
    List<String> hadethLines = hadethFileContent.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}

import 'package:communityapp/schemes/schemeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Schemes extends StatefulWidget {
  const Schemes({Key? key}) : super(key: key);

  @override
  State<Schemes> createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {
  @override
  Widget build(BuildContext context) {
    Widget sectionCreator(
            String title, String url, String viewTitle, String pdfUrl) =>
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          padding: EdgeInsets.symmetric(vertical: 15),
          width: 325,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(5, 4),
              )
            ],
          ),
          child: ExpansionTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SchemeView(url, viewTitle)));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: const Text("Visit Website",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                decoration: TextDecoration.underline)),
                      ),
                      Icon(FeatherIcons.globe, size: 20, color: Colors.black)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  FileDownloader.downloadFile(url: pdfUrl);
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Download PDF",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                decoration: TextDecoration.underline)),
                      ),
                      Icon(FeatherIcons.download, size: 20, color: Colors.black)
                    ],
                  ),
                ),
              )
            ],
          ),
        );

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF1FFBA),
      appBar: AppBar(
        title: Text(
          'Goverment Schemes',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Color(0xff004B20),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                sectionCreator(
                    "Pradhan Mantri Fasal Bima Yojna",
                    "https://pmfby.gov.in/",
                    "Pradhan Mantri Fasal Bima Yojna",
                    "https://agricoop.nic.in/Documents/PMFBY_Guidelines.pdf"),
                sectionCreator(
                    "Pradhan Mantri Krishi Sinchai Yojana",
                    "https://pmksy.gov.in/",
                    "Pradhan Mantri Krishi Sinchai Yojana",
                    "https://pmksy.gov.in/pdflinks/Guidelines_English.pdf"),
                sectionCreator(
                    "Paramparagat Krishi Vikas Yojana",
                    "https://vikaspedia.in/agriculture/policies-and-schemes/crops-related/krishi-unnati-yojana/paramparagat-krishi-vikas-yojana",
                    "Paramparagat Krishi Vikas Yojana",
                    "https://darpg.gov.in/sites/default/files/Paramparagat%20Krishi%20Vikas%20Yojana.pdf"),
                sectionCreator(
                    "Pradhan Mantri Kisan Maan-Dhan Yojana",
                    "https://cish.icar.gov.in/event_page.php?a=Launch%20of%20Pradhan%20Mantri%20Kisan%20Maandhan%20Yojana%20(PMKMY)#:~:text=%E0%A4%AA%E0%A5%8D%E0%A4%B0%E0%A4%A7%E0%A4%BE%E0%A4%A8%E0%A4%AE%E0%A4%82%E0%A4%A4%E0%A5%8D%E0%A4%B0%E0%A5%80%20%E0%A4%95%E0%A4%BF%E0%A4%B8%E0%A4%BE%E0%A4%A8%20%E0%A4%AE%E0%A4%BE%E0%A4%A8%E0%A4%A7%E0%A4%A8%20%E0%A4%AF%E0%A5%8B%E0%A4%9C%E0%A4%A8%E0%A4%BE%20(%E0%A4%AA%E0%A5%80%E0%A4%8F%E0%A4%AE%E0%A4%95%E0%A5%87%E0%A4%8F%E0%A4%AE%E0%A4%B5%E0%A4%BE%E0%A4%88)%20%E0%A4%95%E0%A4%BE%20%E0%A4%AA%E0%A5%8D%E0%A4%B0%E0%A4%AE%E0%A5%8B%E0%A4%9A%E0%A4%A8&text=%E0%A4%AF%E0%A4%B9%20%E0%A4%AF%E0%A5%8B%E0%A4%9C%E0%A4%A8%E0%A4%BE%2018%20%E0%A4%B8%E0%A5%87%2040,%E0%A4%89%E0%A4%A8%E0%A4%95%E0%A5%80%20%E0%A4%89%E0%A4%AE%E0%A5%8D%E0%A4%B0%20%E0%A4%AA%E0%A4%B0%20%E0%A4%A8%E0%A4%BF%E0%A4%B0%E0%A5%8D%E0%A4%AD%E0%A4%B0%20%E0%A4%B9%E0%A5%88%E0%A5%A4",
                    "Pradhan Mantri Kisan Maan-Dhan Yojana",
                    "https://pmkisan.gov.in/Documents/PM-KMY%20-%20Operational%20Guidelines.pdf"),
                sectionCreator(
                    "National Agriculture Market",
                    "https://www.enam.gov.in/web/",
                    "National Agriculture Market",
                    "https://static.pib.gov.in/WriteReadData/specificdocs/documents/2021/nov/doc2021112561.pdf"),
                sectionCreator(
                    "Gramin Bhandaran Yojana",
                    "https://hi.vikaspedia.in/agriculture/policies-and-schemes/92b938932-938947-93890292c90292793f924-92894092493f92f93e902/91794d93093e92e940923-92d90292193e930-92f94b91c92893e",
                    "Gramin Bhandaran Yojana",
                    "http://www.digitalrtimission.com/uploads/GRAMIN_BHANDARAN_YOJANA.pdf"),
                sectionCreator(
                    "PM Kisan Samman Nidhi Yojana",
                    "https://pmkisan.gov.in/",
                    "PM Kisan Samman Nidhi Yojana",
                    "https://pmkisan.gov.in/Documents/%E0%A4%AA%E0%A5%8D%E0%A4%B0%E0%A4%A7%E0%A4%BE%E0%A4%A8%E0%A4%AE%E0%A4%82%E0%A4%A4%E0%A5%8D%E0%A4%B0%E0%A5%80%20%E0%A4%95%E0%A4%BF%E0%A4%B8%E0%A4%BE%E0%A4%A8%20%E0%A4%B8%E0%A4%AE%E0%A5%8D%E0%A4%AE%E0%A4%BE%E0%A4%A8%20%E0%A4%A8%E0%A4%BF%E0%A4%A7%E0%A4%BF.pdf"),
                sectionCreator(
                    "Soil Health Card",
                    "https://www.india.gov.in/spotlight/soil-health-card#tab=tab-1",
                    "Soil Health Card",
                    "https://www.manage.gov.in/fpoacademy/CGSchemes/Soil%20Health%20Cards%20Scheme.pdf"),
                sectionCreator(
                    "Kisan Credit Card",
                    "https://pib.gov.in/FactsheetDetails.aspx?Id=148600",
                    "Kisan Credit Card",
                    "https://rbidocs.rbi.org.in/rdocs/content/pdfs/CRB5100512AN.pdf"),
                sectionCreator(
                    "Micro Irrigation Fund scheme",
                    "https://www.nabard.org/content1.aspx?id=1720&catid=8&mid=8",
                    "Micro Irrigation Fund scheme",
                    "https://pmksy.gov.in/microirrigation/Archive/Guideline_MIF03082018.pdf"),
                sectionCreator(
                    "National Mission For Sustainable Agriculture",
                    "https://nmsa.dac.gov.in/",
                    "National Mission For Sustainable Agriculture",
                    "https://agricoop.nic.in/sites/default/files/National%20Mission%20For%20Sustainable%20Agriculture-DRAFT-Sept-2010.pdf"),
                sectionCreator(
                    "Mission for Integrated Development of Horticulture",
                    "https://midh.gov.in/Contacts.aspx#",
                    "Mission for Integrated Development of Horticulture",
                    "https://midh.gov.in/PDF/midh(English).pdf"),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

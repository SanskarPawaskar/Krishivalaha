import 'dart:convert';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

dynamic createAlbum(dynamic selectSate, dynamic selectDistrict) async {
  final response = await http.get(
    Uri.parse(
        'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001074b92ec08e74cfe6ac985dbf6d73202%20&format=json&limit=173&filters%5Bstate%5D=$selectSate&filters%5Bdistrict%5D=$selectDistrict'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return jsonDecode(response.body);
  } else {
    print(response.statusCode);
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('No Data Found');
  }
}

class ApmcPage extends StatefulWidget {
  const ApmcPage({super.key});

  @override
  State<ApmcPage> createState() => _ApmcPageState();
}

class _ApmcPageState extends State<ApmcPage> {
  String? _selectedState;
  String? _selectedDistrict;
  String? selectedState;
  String? selectedDistrict;

  final Map<String, List<String>> _stateDistrictMap = {
    'Andaman and Nicobar': [
      'Nicobar',
      'North and Middle Andaman',
      'South Andaman'
    ],
    'Andhara Pradesh': [
      'Anantapur',
      'Chittor',
      'Cuddapah',
      'East Godavari',
      'Guntur',
      'Krishna',
      'Kurnool',
      'Nellore',
      'Prakasam',
      'Srikakulam',
      'Vijayanagaram',
      'Visakhapatnam',
      'West Godavari'
    ],
    'Arunachal Pradesh': [
      'Changlang',
      'East Kameng',
      'East Siang',
      'kurung Kummey',
      'Lohit',
      'Lower Dibang Valley',
      'Lower Subansiri',
      'Papum Pore',
      'Tawang',
      'Tirap',
      'Upper Subansiri',
      'West Kameng',
      'West Siang'
    ],
    'Assam': [
      'Bangaigaon',
      'Barpeta',
      'Cachar',
      'Darrang',
      'Dhemaji',
      'Dhubri',
      'Dibrugarh',
      'Goalpara',
      'Golaghat',
      'Hailakandi',
      'Jorhat',
      'Kamrup',
      'Karbi Anglong',
      'Karimganj',
      'Kokrajhar',
      'Lakhimpur',
      'Marigaon',
      'Mangaldoi',
      'Nagaon',
      'Nalbari',
      'Sonitpur',
      'Tinsukia'
    ],
    'Bihar': [
      'Araria',
      'Arwal',
      'Aurangabad',
      'Banka',
      'Begusarai',
      'Bhagalpur',
      'Bhojpur',
      'Buxar',
      'Darbhanga',
      'East Champaran/Motihari',
      'Gaya',
      'Gopalganj',
      'Jamui',
      'Jehanabad',
      'Kaimur/Bhabua',
      'Katihar',
      'Khagaria',
      'Kishanganj',
      'Madhepura',
      'Madhubani',
      'Muzaffarpur',
      'Nalanda',
      'Nawada',
      'Patna',
      'Purnia/Purnea',
      'Rohtas',
      'Saharsa',
      'Samastipur',
      'Saran',
      'Sheikhpura',
      'Sheohar',
      'Sitamarhi',
      'Siwan',
      'Supaul',
      'Vaishali',
      'West Champaran'
    ],
    'Chandigarh': ['Chandigarh'],
    'chattisgarth': [
      'Balod',
      'Balodabazar',
      'Balrampur',
      'Bastar',
      'Bemetara',
      'Bijapur',
      'Bilaspur',
      'Dantewada',
      'Dhamtari',
      'Durg',
      'Gariyaband',
      'Jashpur',
      'Kabirdham',
      'Kanker',
      'Kawardha',
      'Kondagaon',
      'Korba',
      'Koria',
      'Mahasamund',
      'Mungeli',
      'Narayanpur',
      'North Bastar',
      'Raigarh',
      'Raipur',
      'Rajnandgaon',
      'Sukma',
      'Surajpur',
      'Surguja'
    ],
    'Dadra and Nagar Haveli': ['Dadra and Nagar Haveli', 'silvassa'],
    'Daman and Diu': ['Daman', 'Diu'],
    'Goa': ['North Goa', 'South Goa'],
    'Gujarat': [
      'Ahmedabad',
      'Amreli',
      'Anand',
      'Aravalli',
      'Banaskanth',
      'Bharuch',
      'Bhavnagar',
      'Botad',
      'Chhota Udaipur',
      'Dahod',
      'Dang',
      'Devbhumi Dwarka',
      'Gandhinagar',
      'Gir Somnath',
      'Jamnagar',
      'Junagarh',
      'Kachchh',
      'Kheda',
      'Mahisagar',
      'Mehsana',
      'Morbi',
      'Narmada',
      'Navsari',
      'Panchmahals',
      'Patan',
      'Porbandar',
      'Rajkot',
      'Sabarkantha',
      'Surat',
      'Surendranagar',
      'Tapi',
      'The Dangs',
      'Vadodara',
      'Valsad'
    ],
    'Haryana': [
      'Ambala',
      'Faridabad',
      'Fatehabad',
      'Gurgaon',
      'Hissar',
      'Jhajar',
      'Jind',
      'Kaithal',
      'Karnal',
      'Kurukshetra',
      'Mahendragarh-Narnaul',
      'Palwal',
      'Panchkula',
      'Panipat',
      'Rewari',
      'Rohtak',
      'Sirsa',
      'Sonipat',
      'Yamuna Nagar'
    ],
    'Himachal Pradesh': [
      'Bilaspur',
      'Chamba',
      'Hamirpur',
      'Kangra',
      'Kinnaur',
      'Kullu',
      'Lahaul and Spiti',
      'Mandi',
      'Shimla',
      'Sirmore',
      'Solan',
      'Una'
    ],
    'Jammu and Kashmir': [
      'Anantnag',
      'Bandipora',
      'Baramulla',
      'Budgam',
      'Doda',
      'Ganderbal',
      'Jammu',
      'Kargil',
      'Kathua',
      'Kishtwar',
      'Kulgam',
      'Kupwara',
      'Leh',
      'Poonch',
      'Pulwama',
      'Rajouri',
      'Ramban',
      'Reasi',
      'Samba',
      'Shopian',
      'Srinagar',
      'Udhampur'
    ],
    'Jharkhand': [
      'Bokaro',
      'Chatra',
      'Deogarth',
      'Dhanbad',
      'Dumka',
      'East Singhbhum',
      'Garhwa',
      'Giridih',
      'Godda',
      'Gumla',
      'Hazaribagh',
      'Jamtara',
      'Khunti',
      'Koderma',
      'Latehar',
      'Lohardaga',
      'Pakur',
      'Palamu',
      'Ramgarh',
      'Ranchi',
      'Sahebgang',
      'Seraikela Kharsawan',
      'Simdega',
      'West Singhbhum'
    ],
    'Karnataka': [
      'Bagalkot',
      'Belgaum',
      'Bangalore',
      'Bidar',
      'Chamarajanagar',
      'Chikmagalur',
      'Chitradurga',
      'Davanagere',
      'Dharwad',
      'Gadag',
      'Hassan',
      'Haveri',
      'Gulbarga',
      'Kodagu',
      'Kolar',
      'Koppal',
      'Mandya',
      'Mysore',
      'Raichur',
      'Ramanagar',
      'Shimoga',
      'Tumkur',
      'Udupi'
    ],
    'Kerala': [
      'Alappuzha',
      'Alleppey',
      'Ernakulam',
      'Idukki',
      'Kannur',
      'Kasaragod',
      'Kollam',
      'Kottayam',
      'Kozhikode',
      'Malappuram',
      'Palakkad',
      'Pathanamthitta',
      'Thiruvananthapuram',
      'Thrissur',
      'Wayanad',
    ],
    'Lakshadweep': ['Kavaratti'],
    'Madhya Pradesh': [
      'Alirajpur',
      'Anuppur',
      'Ashoknagar',
      'Balaghat',
      'Barwani',
      'Betul',
      'Bhind',
      'Bhopal',
      'Burhanpur',
      'Chhatarpur',
      'Chhindwara',
      'Damoh',
      'Datia',
      'Dewas',
      'Dhar',
      'Dindori',
      'Guna',
      'Gwalior',
      'Harda',
      'Hoshangabad',
      'Indore',
      'Jabalpur',
      'Jhabua',
      'Katni',
      'Khandwa',
      'Khargone',
      'Mandla',
      'Mandsaur',
      'Morena',
      'Narsinghpur',
      'Neemuch',
      'Panna',
      'Raisen',
      'Rajgarh',
      'Ratlam',
      'Rewa',
      'Sagar',
      'Satna',
      'Sehore',
      'Seoni',
      'Shahdol',
      'Shajapur',
      'Sheopur',
      'Shivpuri',
      'Sidhi',
      'Singrauli',
      'Tikamgarh',
      'Ujjain',
      'Umaria',
      'Vidisha'
    ],
    'Maharashtra': [
      'Ahmednagar',
      'Akola',
      'Amravati',
      'Aurangabad',
      'Beed',
      'Bhandara',
      'Buldhana',
      'Chandrapur',
      'Dhule',
      'Gadchiroli',
      'Gondia',
      'Hingoli',
      'Jalgaon',
      'Jalna',
      'Kolhapur',
      'Latur',
      'Mumbai City',
      'Mumbai Suburban',
      'Nagpur',
      'Nanded',
      'Nandurbar',
      'Nashik',
      'Osmanabad',
      'Palghar',
      'Parbhani',
      'Pune',
      'Raigad',
      'Ratnagiri',
      'Sangli',
      'Satara',
      'Sindhudurg',
      'Solapur',
      'Thane',
      'Wardha',
      'Washim',
      'Yavatmal'
    ],
    'Manipur': [
      'Imphal East',
      'Imphal West',
      'Bishnupur',
      'Thoubal',
      'Kakching',
      'Ukhrul',
      'Chandel',
      'Churachandpur',
      'Senapati',
      'Tamenglong',
      'Noney'
    ],
    'Meghalaya': [
      'East Garo Hills',
      'East Jaintia Hills',
      'East Khasi Hills',
      'North Garo Hills',
      'Ri-Bhoi',
      'South Garo Hills',
      'South West Garo Hills',
      'South West Khasi Hills',
      'West Garo Hills',
      'West Jaintia Hills',
      'West Khasi Hills'
    ],
    'Mizoram': [
      'Aizawl',
      'Champhai',
      'Kolasib',
      'Lawngtlai',
      'Lunglei',
      'Mamit',
      'Saiha',
      'Serchhip'
    ],
    'Nagaland': [
      'Dimapur',
      'Kiphire',
      'Kohima',
      'Longleng',
      'Mokokchung',
      'Mon',
      'Noklak',
      'Peren',
      'Phek',
      'Tuensang',
      'Wokha',
      'Zunheboto'
    ],
    'NCT and Delhi': [
      'Central Delhi',
      'East Delhi',
      'New Delhi',
      'North Delhi',
      'North East Delhi',
      'North West Delhi',
      'Shahdara',
      'South Delhi',
      'South East Delhi',
      'South West Delhi',
      'West Delhi'
    ],
    'Odisha': [
      'Angul',
      'Balangir',
      'Balasore',
      'Bargarh',
      'Bhadrak',
      'Boudh',
      'Cuttack',
      'Deogarh',
      'Dhenkanal',
      'Gajapati',
      'Ganjam',
      'Jagatsinghpur',
      'Jajpur',
      'Jharsuguda',
      'Kalahandi',
      'Kandhamal',
      'Kendrapara',
      'Kendujhar',
      'Khordha',
      'Koraput',
      'Malkangiri',
      'Mayurbhanj',
      'Nabarangpur',
      'Nayagarh',
      'Nuapada',
      'Puri',
      'Rayagada',
      'Sambalpur',
      'Sonepur',
      'Sundargarh'
    ],
    'Pondicherry': ['Karaikal', 'Mahe', 'Puducherry', 'Yanam'],
    'Punjab': [
      'Amritsar',
      'Barnala',
      'Bathinda',
      'Faridkot',
      'Fatehgarh Sahib',
      'Fazilka',
      'Ferozepur',
      'Gurdaspur',
      'Hoshiarpur',
      'Jalandhar',
      'Kapurthala',
      'Ludhiana',
      'Mansa',
      'Moga',
      'Muktsar',
      'Pathankot',
      'Patiala',
      'Rupnagar ',
      'Sangrur',
      'Tarn Taran'
    ],
    'Rajasthan': [
      'Ajmer',
      'Alwar',
      'Banswara',
      'Baran',
      'Barmer',
      'Bharatpur',
      'Bhilwara',
      'Bikaner',
      'Bundi',
      'Chittorgarh',
      'Churu',
      'Dausa',
      'Dholpur',
      'Dungarpur',
      'Hanumangarh',
      'Jaipur',
      'Jaisalmer',
      'Jalore',
      'Jhalawar',
      'Jhunjhunu',
      'Jodhpur',
      'Karauli',
      'Kota',
      'Nagaur',
      'Pali',
      'Pratapgarh',
      'Rajsamand',
      'Sawai Madhopur',
      'Sikar',
      'Sirohi',
      'Sri Ganganagar',
      'Tonk',
      'Udaipur'
    ],
    'SikKim': ['East Sikkim', 'North Sikkim', 'South Sikkim', 'West Sikkim'],
    'Tamil Nadu': [
      'Ariyalur',
      'Chennai',
      'Coimbatore',
      'Dharmapuri',
      'Dindigul',
      'Erode',
      'Kancheepuram',
      'Karur',
      'Krishnagiri',
      'Madurai',
      'Nagapattinam',
      'Namakkal',
      'Nilgiris',
      'Perambalur',
      'Pudukkottai',
      'Ramanathapuram',
      'Salem',
      'Sivaganga',
      'Thanjavur',
      'Theni',
      'Tiruchirappalli',
      'Tirunelveli',
      'Tirupathur',
      'Tiruppur',
      'Tiruvallur',
      'Tiruvannamalai',
      'Tiruvarur',
      'Vellore',
      'Viluppuram',
      'Virudhunagar'
    ],
    'Telangana': [
      'Adilabad',
      'Hyderabad ',
      'Jagtiyal',
      'Kamareddy',
      'Karimnagar',
      'Khammam',
      'Mahabubnagar',
      'Medak',
      'Nalgonda',
      'Nizamabad',
      'Rangareddy',
      'Siddipet',
      'Warangal'
    ],
    'Tripura': [
      'Dhalai',
      'Gomati',
      'Khowai',
      'North Tripura',
      'Sepahijala',
      'South Tripura',
      'Unakoti',
      'West Tripura'
    ],
    'Uttar Pradesh': [
      'Agra',
      'Aligarh',
      'Ambedkar Nagar',
      'Auraiya',
      'Ayodhya ',
      'Azamgarh',
      'Baghpat',
      'Bahraich',
      'Ballia',
      'Balrampur',
      'Banda',
      'Barabanki',
      'Bareilly',
      'Basti',
      'Bhadohi',
      'Bijnor',
      'Bulandshahr',
      'Chandauli',
      'Chitrakoot',
      'Deoria',
      'Etah',
      'Etawah',
      'Farrukhabad',
      'Fatehpur',
      'Firozabad',
      'Gautam Buddha Nagar',
      'Ghaziabad',
      'Ghazipur',
      'Gonda',
      'Gorakhpur',
      'Hamirpur',
      'Hapur ',
      'Hardoi',
      'Hathras',
      'Jalaun',
      'Jaunpur',
      'Jhansi',
      'Kannauj',
      'Kanpur Dehat',
      'Kanpur Nagar',
      'Kaushambi',
      'Khiri',
      'Lakhimpur',
      'Lucknow ',
      'Maharajganj',
      'Mahoba',
      'Mainpuri',
      'Mathura',
      'Mau',
      'Meerut',
      'Mirzapur',
      'Moradabad',
      'Muzaffarnagar',
      'Pilibhit',
      'Pratapgarh',
      'Prayagraj ',
      'Rae Bareli',
      'Rampur',
      'Saharanpur',
      'Sambhal',
      'Sant Kabir Nagar',
      'Shahjahanpur',
      'Shamli',
      'Shravasti',
      'Siddharthnagar',
      'Sitapur',
      'Sonbhadra',
      'Sultanpur',
      'Unnao',
      'Varanasi'
    ],
    'Uttrakhand': [
      'Almora',
      'Bageshwar',
      'Chamoli',
      'Champawat',
      'Dehradun',
      'Haridwar',
      'Nainital',
      'Pauri Garhwal',
      'Pithoragarh',
      'Rudraprayag',
      'Tehri Garhwal',
      'Udham Singh Nagar',
      'Uttarkashi'
    ],
    'West Bengal': [
      'Bankura',
      'Birbhum',
      'Cooch Behar',
      'Dakshin Dinajpur',
      'Darjeeling',
      'Hooghly',
      'Howrah',
      'Jalpaiguri',
      'Kolkata',
      'Malda',
      'Medinipur',
      'Murshidabad',
      'Nadia',
      'North 24 Parganas',
      'Puruliya',
      'South 24 Parganas',
      'Uttar Dinajpur'
    ],
  };

  List<DropdownMenuItem<String>> _buildStatesDropdown() {
    return _stateDistrictMap.keys.map((state) {
      return DropdownMenuItem(
        value: state,
        child: Text(state),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _buildDistrictsDropdown(String selectedState) {
    if (selectedState == null) {
      return [];
    }

    final districts = _stateDistrictMap[selectedState];
    items:
    return districts?.map((district) {
          return DropdownMenuItem(
            value: district,
            child: Text(district),
          );
        }).toList() ??
        [];
  }

  dynamic _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'APMC commodity price',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            backgroundColor: Color(0xff004B20),
            leading: IconButton(
              icon: const Icon(FeatherIcons.chevronLeft,
                  size: 30, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
          child: (_futureAlbum == null) ? apmcPage() : buildFutureBuilder(),
        ));
  }

  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder<dynamic>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: ListView.builder(
                itemCount: snapshot.data['records'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // decoration: const BoxDecoration(
                      //   border: Border(
                      //     bottom: BorderSide(
                      //       color: Colors.grey,
                      //       width: 1.0,
                      //     ),
                      //   ),
                      // ),

                      // margin: EdgeInsets.symmetric(vertical: 0.0),
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 5),

                      decoration: BoxDecoration(
                        color: Color(0xffF1FFBA),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ListTile(
                          // title: snapshot.data['records'][index+1]['state'] == 'Jammu and Kashmir'? Container(child: Text(snapshot.data['records'][8]['commodity'])):Container(),
                          title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.grey),
                              Text(
                                ' ${snapshot.data['records'][index]['state']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 75)),
                              const Icon(Icons.apartment, color: Colors.grey),
                              Text(
                                ' ${snapshot.data['records'][index]['district']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 15)),
                          Row(
                            children: [
                              const Icon(Icons.date_range, color: Colors.grey),
                              Text(
                                '${snapshot.data['records'][index]['arrival_date']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 20)),
                              const Icon(Icons.local_grocery_store,
                                  color: Colors.grey),
                              Expanded(
                                child: Text(
                                  '${snapshot.data['records'][index]['commodity']}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 15)),
                          Row(
                            children: [
                              const Icon(Icons.trending_up_rounded,
                                  color: Colors.green),
                              Text(
                                '₹ ${snapshot.data['records'][index]['min_price']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 20)),
                              const Icon(Icons.trending_down_rounded,
                                  color: Colors.green),
                              Text(
                                '₹ ${snapshot.data['records'][index]['max_price']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 20)),
                              const Icon(Icons.trending_flat_rounded,
                                  color: Colors.green),
                              Text(
                                '₹ ${snapshot.data['records'][index]['modal_price']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Padding apmcPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 20.0),
                const Text(
                  "State :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Color.fromARGB(255, 78, 78, 77)),
                  textAlign: TextAlign.end,
                ),
              ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: const Text('Select State'),
                  isExpanded: true,
                  value: _selectedState,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedState = newValue as String?;
                      _selectedDistrict = null;
                    });
                  },
                  items: _buildStatesDropdown(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(width: 20.0),
                const Text(
                  "District :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Color.fromARGB(255, 78, 78, 77)),
                  textAlign: TextAlign.end,
                ),
              ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: const Text('Select District'),
                  isExpanded: true,
                  value: _selectedDistrict,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDistrict = newValue as String?;
                    });
                  },
                  items: _buildDistrictsDropdown(_selectedState.toString()),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            width: 200,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff004B20)),
              onPressed: () {
                setState(() {
                  _futureAlbum = createAlbum(_selectedState, _selectedDistrict);
                });
              },
              child: const Text("Submit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

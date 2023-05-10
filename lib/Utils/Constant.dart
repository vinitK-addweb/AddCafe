import 'package:get/get_rx/src/rx_types/rx_types.dart';

String kBaseUrl = 'https://cafe.addwebprojects.com/api/v1/';
String kImgUrl = 'https://cafe.addwebprojects.com';
// String kBaseUrl = 'http://localhost:3000/';

const kASSETURL = 'assets/image/';
const kDefaultImage = 'mainlogo.png';
const kTOKEN = 'token';
String kTOKENSAVED = '';

const kUSERID = '_id';
String kUSERIDSAVED = '';
RxBool isSwitched = true.obs;

bool islogin = false;
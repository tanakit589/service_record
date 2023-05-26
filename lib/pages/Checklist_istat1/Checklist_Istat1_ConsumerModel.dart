
import 'package:flutter/widgets.dart';

class Checklist_Istat1_ConsumerModel extends ChangeNotifier {
  late bool _no1;
  late bool _no2_Jams;
  late bool _no2_Clew;
  late bool _no3_a;
  late bool _no3_b;
  late bool _no4_a;
  late bool _no4_b;
  late bool _no4_c;
  late bool _no4_d;
  late bool _no4_e;
  late bool _no4_f;
  late bool _no5_a;
  late bool _no5_b;
  late bool _no5_c;
  late bool _no6;
  late bool _no7;
  late bool _no8;
  String _jamsVer='';
  String _clewVer='';
  String _remarks='';
  String _temp='';
  get temp => this._temp;

 set temp( value) { this._temp = value;
 notifyListeners();
 }

 get remarks => this._remarks;

 set remarks( value) { this._remarks = value;
 notifyListeners();
 }

  get jamsVer => this._jamsVer;

 set jamsVer( value) { this._jamsVer = value;
notifyListeners();
 }
  get clewVer => this._clewVer;

 set clewVer( value) { this._clewVer = value;
notifyListeners();
 }
  get no1 => this._no1;

 set no1( value) { this._no1 = value;
 notifyListeners();
 }

  get no2_Jams => this._no2_Jams;

 set no2_Jams( value) { this._no2_Jams = value;
 notifyListeners();
 }

  get no2_Clew => this._no2_Clew;

 set no2_Clew( value) { this._no2_Clew = value;
notifyListeners();
 }
  get no3_a => this._no3_a;

 set no3_a( value) { this._no3_a = value;
notifyListeners();
 }
  get no3_b => this._no3_b;

 set no3_b( value) { this._no3_b = value;
notifyListeners();
 }
  get no4_a => this._no4_a;

 set no4_a( value) { this._no4_a = value;
notifyListeners();
 }
  get no4_b => this._no4_b;

 set no4_b( value) { this._no4_b = value;
notifyListeners();
 }
  get no4_c => this._no4_c;

 set no4_c( value) { this._no4_c = value;
notifyListeners();
 }
  get no4_d => this._no4_d;

 set no4_d( value) { this._no4_d = value;
notifyListeners();
 }

  get no4_e => this._no4_e;

 set no4_e( value) { this._no4_e = value;
notifyListeners();
 }
 
  get no4_f => this._no4_f;

 set no4_f( value) { this._no4_f = value;
notifyListeners();
 }
 
  get no5_a => this._no5_a;

 set no5_a( value) { this._no5_a = value;
notifyListeners();
 }
 
  get no5_b => this._no5_b;

 set no5_b( value) { this._no5_b = value;
notifyListeners();
 }
 
  get no5_c => this._no5_c;

 set no5_c( value) { this._no5_c = value;
notifyListeners();
 }
 
  get no6 => this._no6;

 set no6( value) { this._no6 = value;
notifyListeners();
 }
 
  get no7 => this._no7;

 set no7( value) { this._no7 = value;
notifyListeners();
 }
 
  get no8 => this._no8;

 set no8( value) { this._no8 = value;
notifyListeners();
 }
 

  
}
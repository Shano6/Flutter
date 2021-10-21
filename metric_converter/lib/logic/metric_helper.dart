class MetricHelper {

  double convertTo(double amount, String? from, String? to) {
    var both='';
    if(from!=null && to !=null){
      both = from+"|"+to;
    }

    switch(both) {
      case 'M|Km': {
        double converted = amount*0.001;
        return converted;
      }
      break;

      case 'Km|M': {
        double converted = amount*100;
        return converted;
      }
      break;

      case 'Km|Mile': {
        double converted = 0.6213;
        return converted;
      }
      break;

      case 'Mile|Km': {
        double converted = amount*1.6;
        return converted;
      }
      break;

      case 'Mile|M': {
        double converted = amount*1609;
        return converted;
      }
      break;

      case 'M|Mile': {
        double converted = amount*0.0006;
        return converted;
      }
      break;

      default: {
        //statements;
      }
      break;
    }


    return amount;
  }
}
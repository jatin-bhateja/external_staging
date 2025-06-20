abstract class apayload {
    abstract double accumulate();
}

value class payload extends apayload {
    double field1;
    double field2;
    double field3;
    double field4;
    public payload (double obj) {
        field1 = obj;
        field2 = obj;
        field3 = obj;
        field4 = obj;
    }
    public double accumulate() {
        return field1 + field2 + field3 + field4;
    }
}


public class check_cast {
    public static apayload micro(apayload obj) {
         // checkcast: through profiled parameter.
         payload pobj = (payload)obj;
         // explicit checkcast.
         return pobj;
    }
    public static void main (String [] args) {
         double res = 0.0;
         for (int i = 0; i < 10000; i++) {
             // DontInline micro.
             res += micro(new payload((double)i))
                   .accumulate(); // VirtualCallData. receiver is payload.
             //  argument: Lpayload;
             //  accumulate() -> opt virtual call to payload::accumulate.
         }
         System.out.println("[res] " + res);
    }
}


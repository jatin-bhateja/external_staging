
import java.util.*;
import java.util.stream.*;

class GenArray {
    public <F extends Number, E extends Number> Number getScalarValue(E from, Class<F> toClass) {
        if (toClass == Byte.class)
           return Byte.valueOf(from.byteValue());
        else if (toClass == Short.class)
           return Short.valueOf(from.shortValue());
        else if(toClass == Integer.class)
           return Integer.valueOf(from.intValue());
        else if(toClass == Long.class)
           return Long.valueOf(from.longValue());
        else if(toClass == Float.class)
           return Float.valueOf(from.floatValue());
        else if(toClass == Double.class)
           return Double.valueOf(from.doubleValue());
        else 
           return null;
    }

    public static <F extends Number ,E extends Number> void printArr2(E [] AL) {
       F obj;
       for(int i = 0; i < AL.length; i++) {
         obj = GenArray.<F,E>getScalarValue(AL[i], obj.getClass());
         System.out.println(num);
       }
    } 

    public static <E extends Number> void printArr(List<E> AL) {
        var AO = AL.toArray()[0];
        if (AO.getClass() == (new int[0]).getClass()) {
           int [] ia = (int [])AO;
           for(int i = 0; i < ia.length; i++)
               System.out.println(ia[i]);
        } else if (AO.getClass() == (new byte[0]).getClass()) {
           byte [] ba = (byte [])AO;
           for(int i = 0; i < ba.length; i++)
               System.out.println(ba[i]);
        } else if (AO.getClass() == (new float[0]).getClass()) {
           float [] fa = (float [])AO;
           for(int i = 0; i < fa.length; i++)
               System.out.println(fa[i]);
        } else {
           System.out.println("Unhandled type");
        } 
    }

    public static void main(String [] args) {
       int [] iarr = {1100,2200,3300,4400};
       float [] farr = {1.0f,2.0f,3.0f,4.0f};
       byte [] barr = {1,2,3,4};
       GenArray.<int[]>printArr(Arrays.asList(iarr));
       GenArray.<float[]>printArr(Arrays.asList(farr));
       GenArray.<byte[]>printArr(Arrays.asList(barr));

       Integer [] Iarr = IntStream.of(iarr).boxed().toArray(Integer[]::new);
       Double  [] Farr = DoubleStream.of(farr).boxed().toArray(Double[]::new);
       Integer [] Barr = IntStream.of(barr).boxed().toArray(Integer[]::new);
       GenArray.<Integer,Integer>printArr2(Iarr);
       GenArray.<Float,Double>printArr2(Farr);
       GenArray.<Byte,Integer>printArr2(Barr);
    }
}

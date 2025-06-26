//package com.intel;


import jdk.incubator.vector.ByteVector;
import jdk.incubator.vector.VectorMask;
import jdk.incubator.vector.VectorOperators;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

public class test {
    static final byte quote = "\"".getBytes(StandardCharsets.UTF_8)[0];
    public static String readFile(String filePath){
        StringBuilder sb = new StringBuilder();
        BufferedReader br;
        File file = new File( filePath);
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "utf-8"));
            int ch = 0;
            while (true) {
                if (!((ch = br.read()) != -1)) break;
                sb.append((char) ch);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String text = sb.toString();
        return text;
    }


    private static int myFindQuote_Vector(String text, int idx) {
        byte[] bytes8 = text.getBytes(StandardCharsets.UTF_8);
        int bytesLength = bytes8.length;
        int mod = bytesLength % 64;
        int v =  mod == 0 ? 0 : 64 - mod;
        int utf8BytesLen = bytesLength + v;
        //System.out.println("utf8BytesLen: " + utf8BytesLen);
        byte[] bytes = Arrays.copyOf(bytes8, utf8BytesLen);
        boolean[] result = new boolean[utf8BytesLen];
        ByteVector byteVector = null;
        //System.out.println("initial cost time is " + (end - start));

        VectorOperators.Comparison op = VectorOperators.EQ ;
        byte[] quoteBytes = new byte[64];
        Arrays.fill(quoteBytes,quote);
        ByteVector bv = ByteVector.fromArray(ByteVector.SPECIES_512, quoteBytes, 0);
        for (int i = 0; i < utf8BytesLen; i += 64) {
            byteVector = ByteVector.fromArray(ByteVector.SPECIES_512, bytes, i);
//          VectorMask<Byte> compare = byteVector.compare(op, quote);
            VectorMask<Byte> compare = byteVector.compare(op, bv);
            compare.intoArray(result, i);
        }
        return result[idx & (utf8BytesLen-1)] ? 1 : 0;
    }

    public static int myFindQuote_Scalar(String text, int idx){
        byte[] bytes8 = text.getBytes(StandardCharsets.UTF_8);
        int bytesLength = bytes8.length;
        int mod = bytesLength % 64;
        int v =  mod == 0 ? 0 : 64 - mod;
        int utf8BytesLen = bytesLength + v;
        byte[] bytes = Arrays.copyOf(bytes8, utf8BytesLen);
        boolean[] result = new boolean[utf8BytesLen];
        ByteVector byteVector = null;
        //System.out.println("initial cost time is " + (end - start));
        for (int i = 0; i < utf8BytesLen; i++) {
            if(bytes[i] == quote){
                result[i] = true;
            }else {
                result[i] = false;
            }
        }
        return result[idx & (utf8BytesLen-1)] ? 1 : 0;
    }


    public static void main(String[] args) {
        String filePath = args[0];
        String text = readFile(filePath);

        int res = 0;
        for(int i = 0 ; i < 10000; i++) {
           res += myFindQuote_Vector(text, i);
        }
        for(int i = 0 ; i < 10000; i++) {
           res += myFindQuote_Scalar(text, i);
        }

        res = 0;
        long t1 = System.currentTimeMillis();
        for(int i = 0 ; i < 10000; i++) {
           res += myFindQuote_Vector(text, i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("--------------------------------------------");
        System.out.println("Vector API cost time is: " + (t2 - t1) + " ms  [Res] = " + res);
        System.out.println("--------------------------------------------");

        res = 0;
        t1 = System.currentTimeMillis();
        for(int i = 0 ; i < 10000; i++) {
           res += myFindQuote_Scalar(text, i);
        }
        t2 = System.currentTimeMillis();

        System.out.println("--------------------------------------------");
        System.out.println("Scalar API cost time is: " + (t2 - t1) + " ms  [Res] =  " + res );
        System.out.println("--------------------------------------------");
    }
}

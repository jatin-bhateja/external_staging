//package com.intel.lgiacchi;

import java.io.*;
import java.util.concurrent.ThreadLocalRandom;

public class DoubleStream {

    int size;
    boolean random;
    boolean preComputed;
    boolean batched;

    boolean toFile; // precompute the stream and write to file
    String file = "double_stream.txt";
    DataInputStream dis;
    int readBufferSize = 4096;

    double[] data;
    int index;

    int batchSize = 100;
    double[] buffer;
    int bufferIndex = 0;

    long maxValue = 128;

    public DoubleStream(boolean random, boolean preComputed, boolean batched, boolean toFile) {
        this.random = random;
        this.preComputed = preComputed;
        this.batched = batched;
        this.toFile = toFile;
    }

    public void initialize(int size) {
        this.size = size;
        buffer = new double[batchSize];

        if (random) {
            data = ThreadLocalRandom.current().doubles(size, 0, maxValue).toArray();
        } else {
            data = new double[size];
            for (int i = 0; i < size; i++) {
                data[i] = i%maxValue;
            }
        }

        if (toFile) {
            try {
                FileOutputStream fos = new FileOutputStream(file);
                DataOutputStream dos = new DataOutputStream(fos);
                for (int i = 0; i < 100; i++) {
                    for (double value : data) {
                        dos.writeDouble(value);
                    }
                }
                dos.close();
                reopenFile();
            } catch(Exception e) {}
        }

        reset();
    }

    public void reset() {
        index = 0;
        bufferIndex = batchSize;
        //if (toFile) {
        //    reopenFile();
        //}
    }

    private void reopenFile() {
        if (dis != null) {
            try {
                dis.close();
            } catch (IOException e) {}
        }

        BufferedInputStream bif = null;
        try {
            FileInputStream fis = new FileInputStream(file);
            bif = new BufferedInputStream(fis, readBufferSize);
        } catch (FileNotFoundException e) {}
        dis = new DataInputStream(bif);
    }


    public double getNext() {
        if (batched) {
            if (bufferIndex >= batchSize) {  // refill buffer
                for (int i = 0; i < batchSize; i++) {
                    buffer[i] = getNextValue();
                }
                bufferIndex = 0;
            }
            double value = buffer[bufferIndex];
            bufferIndex++;
            return value;
        } else {
            return getNextValue();
        }
    }

    public double getNextValue() {
        if (preComputed) {
            double value = 0;
            if (toFile) {
                 try {
                     try {
                         value = dis.readDouble();
                     } catch (EOFException e) {
                         reopenFile();
                         value = dis.readDouble();
                     }
                 } catch (IOException e) {}
            } else {
                value = data[index];
                index = (index + 1) % size;
            }
            return value;
        } else {
            if (random) {
                return ThreadLocalRandom.current().nextDouble(maxValue);
            } else {
                long value = index;
                index = (int) ((index + 1) % maxValue);
                return value;
            }
        }
    }

    public void skip(int count) {
        for (int i = 0; i < count; i++) {
            getNext();
        }
    }

    public String toString() {
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < size; i++) {
            buf.append(data[i]);
            buf.append(" ");
        }
        return buf.toString();
    }
}

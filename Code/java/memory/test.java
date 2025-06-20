

import java.util.Arrays;

class test implements Runnable {
  public int [] arr;
  public int size;
  public int val;
  public int res;
  public int tid;

  public void run() {
     System.out.println("[tid " + tid + " ] Entering thread.");
     arr = new int [size];
     Arrays.fill(arr, val);
     for (int i = 0; i < arr.length; i++) {
         res += arr[i];
     }
     System.out.println("[tid " + tid + " ] Exiting thread.");
  }

  public static void main (String [] args) {
     int tcount = Integer.parseInt(args[0]);
     test [] tds = new test[tcount];
     for (int i = 0; i < tcount; i++) {
        tds[i] = new test();
        tds[i].tid = i + 1;
        tds[i].val = 10;
        tds[i].size =  1024;
     } 
     try { 
        Thread [] tids = new Thread[tcount];
        for (int i = 0 ; i < tcount ; i++) {
           tids[i] = new Thread(tds[i]);
        }
        for (int i = 0 ; i < tcount ; i++) {
           tids[i].start();
        }
        for (int i = 0 ; i < tcount ; i++) {
           tids[i].join();
        }
        for (int i = 0 ; i < tcount ; i++) {
           System.out.println("[tid " + tds[i].tid + " ] " +  " res = " + tds[i].res);
        }
     } catch (Exception e) {
        System.out.println(e);
     }
  }
}

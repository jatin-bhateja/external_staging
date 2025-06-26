


import jdk.incubator.vector.*;


class test {
  public static void workload(int [] a , int [] r) {
    // 
    IntVector v0 = IntVector.fromArray(IntVector.SPECIES_256, a, 0);
    IntVector v1 = IntVector.fromArray(IntVector.SPECIES_256, a, 8);
    IntVector v2 = IntVector.fromArray(IntVector.SPECIES_256, a, 16);
    IntVector v3 = IntVector.fromArray(IntVector.SPECIES_256, a, 24);
    IntVector v4 = IntVector.fromArray(IntVector.SPECIES_256, a, 32);
    IntVector v5 = IntVector.fromArray(IntVector.SPECIES_256, a, 40);
    IntVector v6 = IntVector.fromArray(IntVector.SPECIES_256, a, 48);
    IntVector v7 = IntVector.fromArray(IntVector.SPECIES_256, a, 56);
    IntVector v8 = IntVector.fromArray(IntVector.SPECIES_256, a, 64);
    IntVector v9 = IntVector.fromArray(IntVector.SPECIES_256, a, 72);
    IntVector v10 = IntVector.fromArray(IntVector.SPECIES_256, a, 80);
    IntVector v11 = IntVector.fromArray(IntVector.SPECIES_256, a, 88);
    IntVector v12 = IntVector.fromArray(IntVector.SPECIES_256, a, 96);
    IntVector v13 = IntVector.fromArray(IntVector.SPECIES_256, a, 104);
    IntVector v14 = IntVector.fromArray(IntVector.SPECIES_256, a, 112);
    IntVector v15 = IntVector.fromArray(IntVector.SPECIES_256, a, 120);

    IntVector t1 = v0.add(v15);
    IntVector t2 = v1.add(v14);
    IntVector t3 = v2.add(v13);
    IntVector t4 = v3.add(v12);
    IntVector t5 = v4.add(v11);
    IntVector t6 = v5.add(v10);
    IntVector t7 = v6.add(v9);
    IntVector t8 = v7.add(v8);
    IntVector t9 = v8.add(v7);
    IntVector t10 = v9.add(v6);
    IntVector t11 = v10.add(v5);
    IntVector t12 = v11.add(v4);
    IntVector t13 = v12.add(v3);
    IntVector t14 = v13.add(v2);
    IntVector t15 = v14.add(v1);
    IntVector t16 = v15.add(v0);


    IntVector t17 = t1.add(v0);
    IntVector t18 = t2.add(v1);
    IntVector t19 = t3.add(v2);
    IntVector t20 = t4.add(v3);
    IntVector t21 = t5.add(v4);
    IntVector t22 = t6.add(v5);
    IntVector t23 = t7.add(v6);
    IntVector t24 = t8.add(v7);
    IntVector t25 = t9.add(v8);
    IntVector t26 = t10.add(v9);
    IntVector t27 = t11.add(v10);
    IntVector t28 = t12.add(v11);
    IntVector t29 = t13.add(v12);
    IntVector t30 = t14.add(v13);
    IntVector t31 = t15.add(v14);
    IntVector t32 = t16.add(v15);

    
    t17.intoArray(r, 0);
    t18.intoArray(r, 8);
    t19.intoArray(r, 16);
    t20.intoArray(r, 24);
    t21.intoArray(r, 32);
    t22.intoArray(r, 40);
    t23.intoArray(r, 48);
    t24.intoArray(r, 56);
    t25.intoArray(r, 64);
    t26.intoArray(r, 72);
    t27.intoArray(r, 80);
    t28.intoArray(r, 88);
    t29.intoArray(r, 96);
    t30.intoArray(r, 104);
    t31.intoArray(r, 112);
    t32.intoArray(r, 120);
  }

  public static void main(String [] args) {
     int [] a = new int[128];
     int [] r = new int[128];
     for (int i = 0; i < 128 ; i++)
        a[i] = i + 10;

     for(int i = 0 ; i < 100000 ;i++)
       workload(a, r);
        
     System.out.println("Res = " + r[56]);
  }
}



//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 11 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

/*
IR dump of scalar assignments with shifts and and_mask.
=======================================================
 B0 = (( I0  >> 0 ) & 255  ) << 0 ) | 
 B1 = (( I0  >> 8 ) & 7  ) << 0 ) | (( I1  >> 0 ) & 31  ) << 3 ) | 
 B2 = (( I1  >> 5 ) & 63  ) << 0 ) | (( I2  >> 0 ) & 3  ) << 6 ) | 
 B3 = (( I2  >> 2 ) & 255  ) << 0 ) | 
 B4 = (( I2  >> 10 ) & 1  ) << 0 ) | (( I3  >> 0 ) & 127  ) << 1 ) | 
 B5 = (( I3  >> 7 ) & 15  ) << 0 ) | (( I4  >> 0 ) & 15  ) << 4 ) | 
 B6 = (( I4  >> 4 ) & 127  ) << 0 ) | (( I5  >> 0 ) & 1  ) << 7 ) | 
 B7 = (( I5  >> 1 ) & 255  ) << 0 ) | 
 B8 = (( I5  >> 9 ) & 3  ) << 0 ) | (( I6  >> 0 ) & 63  ) << 2 ) | 
 B9 = (( I6  >> 6 ) & 31  ) << 0 ) | (( I7  >> 0 ) & 7  ) << 5 ) | 
 B10 = (( I7  >> 3 ) & 255  ) << 0 ) | 
 B11 = (( I8  >> 0 ) & 255  ) << 0 ) | 
 B12 = (( I8  >> 8 ) & 7  ) << 0 ) | (( I9  >> 0 ) & 31  ) << 3 ) | 
 B13 = (( I9  >> 5 ) & 63  ) << 0 ) | (( I10  >> 0 ) & 3  ) << 6 ) | 
 B14 = (( I10  >> 2 ) & 255  ) << 0 ) | 
 B15 = (( I10  >> 10 ) & 1  ) << 0 ) | (( I11  >> 0 ) & 127  ) << 1 ) | 
 B16 = (( I11  >> 7 ) & 15  ) << 0 ) | (( I12  >> 0 ) & 15  ) << 4 ) | 
 B17 = (( I12  >> 4 ) & 127  ) << 0 ) | (( I13  >> 0 ) & 1  ) << 7 ) | 
 B18 = (( I13  >> 1 ) & 255  ) << 0 ) | 
 B19 = (( I13  >> 9 ) & 3  ) << 0 ) | (( I14  >> 0 ) & 63  ) << 2 ) | 
 B20 = (( I14  >> 6 ) & 31  ) << 0 ) | (( I15  >> 0 ) & 7  ) << 5 ) | 
 B21 = (( I15  >> 3 ) & 255  ) << 0 ) | 
=======================================================
*/



public class VectorBitPacker11 {

} // Class VectorBitPacker11

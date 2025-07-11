

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 27 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

/*
IR dump of scalar assignments with shifts and and_mask.
=======================================================
 B0 = (( I0  >> 0 ) & 255  ) << 0 ) | 
 B1 = (( I0  >> 8 ) & 255  ) << 0 ) | 
 B2 = (( I0  >> 16 ) & 255  ) << 0 ) | 
 B3 = (( I0  >> 24 ) & 7  ) << 0 ) | (( I1  >> 0 ) & 31  ) << 3 ) | 
 B4 = (( I1  >> 5 ) & 255  ) << 0 ) | 
 B5 = (( I1  >> 13 ) & 255  ) << 0 ) | 
 B6 = (( I1  >> 21 ) & 63  ) << 0 ) | (( I2  >> 0 ) & 3  ) << 6 ) | 
 B7 = (( I2  >> 2 ) & 255  ) << 0 ) | 
 B8 = (( I2  >> 10 ) & 255  ) << 0 ) | 
 B9 = (( I2  >> 18 ) & 255  ) << 0 ) | 
 B10 = (( I2  >> 26 ) & 1  ) << 0 ) | (( I3  >> 0 ) & 127  ) << 1 ) | 
 B11 = (( I3  >> 7 ) & 255  ) << 0 ) | 
 B12 = (( I3  >> 15 ) & 255  ) << 0 ) | 
 B13 = (( I3  >> 23 ) & 15  ) << 0 ) | (( I4  >> 0 ) & 15  ) << 4 ) | 
 B14 = (( I4  >> 4 ) & 255  ) << 0 ) | 
 B15 = (( I4  >> 12 ) & 255  ) << 0 ) | 
 B16 = (( I4  >> 20 ) & 127  ) << 0 ) | (( I5  >> 0 ) & 1  ) << 7 ) | 
 B17 = (( I5  >> 1 ) & 255  ) << 0 ) | 
 B18 = (( I5  >> 9 ) & 255  ) << 0 ) | 
 B19 = (( I5  >> 17 ) & 255  ) << 0 ) | 
 B20 = (( I5  >> 25 ) & 3  ) << 0 ) | (( I6  >> 0 ) & 63  ) << 2 ) | 
 B21 = (( I6  >> 6 ) & 255  ) << 0 ) | 
 B22 = (( I6  >> 14 ) & 255  ) << 0 ) | 
 B23 = (( I6  >> 22 ) & 31  ) << 0 ) | (( I7  >> 0 ) & 7  ) << 5 ) | 
 B24 = (( I7  >> 3 ) & 255  ) << 0 ) | 
 B25 = (( I7  >> 11 ) & 255  ) << 0 ) | 
 B26 = (( I7  >> 19 ) & 255  ) << 0 ) | 
=======================================================
*/



public class VectorBitPacker27 {

} // Class VectorBitPacker27

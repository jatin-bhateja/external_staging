

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 23 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

/*
IR dump of scalar assignments with shifts and and_mask.
=======================================================
 B0 = (( I0  >> 0 ) & 255  ) << 0 ) | 
 B1 = (( I0  >> 8 ) & 255  ) << 0 ) | 
 B2 = (( I0  >> 16 ) & 127  ) << 0 ) | (( I1  >> 0 ) & 1  ) << 7 ) | 
 B3 = (( I1  >> 1 ) & 255  ) << 0 ) | 
 B4 = (( I1  >> 9 ) & 255  ) << 0 ) | 
 B5 = (( I1  >> 17 ) & 63  ) << 0 ) | (( I2  >> 0 ) & 3  ) << 6 ) | 
 B6 = (( I2  >> 2 ) & 255  ) << 0 ) | 
 B7 = (( I2  >> 10 ) & 255  ) << 0 ) | 
 B8 = (( I2  >> 18 ) & 31  ) << 0 ) | (( I3  >> 0 ) & 7  ) << 5 ) | 
 B9 = (( I3  >> 3 ) & 255  ) << 0 ) | 
 B10 = (( I3  >> 11 ) & 255  ) << 0 ) | 
 B11 = (( I3  >> 19 ) & 15  ) << 0 ) | (( I4  >> 0 ) & 15  ) << 4 ) | 
 B12 = (( I4  >> 4 ) & 255  ) << 0 ) | 
 B13 = (( I4  >> 12 ) & 255  ) << 0 ) | 
 B14 = (( I4  >> 20 ) & 7  ) << 0 ) | (( I5  >> 0 ) & 31  ) << 3 ) | 
 B15 = (( I5  >> 5 ) & 255  ) << 0 ) | 
 B16 = (( I5  >> 13 ) & 255  ) << 0 ) | 
 B17 = (( I5  >> 21 ) & 3  ) << 0 ) | (( I6  >> 0 ) & 63  ) << 2 ) | 
 B18 = (( I6  >> 6 ) & 255  ) << 0 ) | 
 B19 = (( I6  >> 14 ) & 255  ) << 0 ) | 
 B20 = (( I6  >> 22 ) & 1  ) << 0 ) | (( I7  >> 0 ) & 127  ) << 1 ) | 
 B21 = (( I7  >> 7 ) & 255  ) << 0 ) | 
 B22 = (( I7  >> 15 ) & 255  ) << 0 ) | 
=======================================================
*/



public class VectorBitPacker23 {

} // Class VectorBitPacker23

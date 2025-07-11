

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 25 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

/*
IR dump of scalar assignments with shifts and and_mask.
=======================================================
 B0 = (( I0  >> 0 ) & 255  ) << 0 ) | 
 B1 = (( I0  >> 8 ) & 255  ) << 0 ) | 
 B2 = (( I0  >> 16 ) & 255  ) << 0 ) | 
 B3 = (( I0  >> 24 ) & 1  ) << 0 ) | (( I1  >> 0 ) & 127  ) << 1 ) | 
 B4 = (( I1  >> 7 ) & 255  ) << 0 ) | 
 B5 = (( I1  >> 15 ) & 255  ) << 0 ) | 
 B6 = (( I1  >> 23 ) & 3  ) << 0 ) | (( I2  >> 0 ) & 63  ) << 2 ) | 
 B7 = (( I2  >> 6 ) & 255  ) << 0 ) | 
 B8 = (( I2  >> 14 ) & 255  ) << 0 ) | 
 B9 = (( I2  >> 22 ) & 7  ) << 0 ) | (( I3  >> 0 ) & 31  ) << 3 ) | 
 B10 = (( I3  >> 5 ) & 255  ) << 0 ) | 
 B11 = (( I3  >> 13 ) & 255  ) << 0 ) | 
 B12 = (( I3  >> 21 ) & 15  ) << 0 ) | (( I4  >> 0 ) & 15  ) << 4 ) | 
 B13 = (( I4  >> 4 ) & 255  ) << 0 ) | 
 B14 = (( I4  >> 12 ) & 255  ) << 0 ) | 
 B15 = (( I4  >> 20 ) & 31  ) << 0 ) | (( I5  >> 0 ) & 7  ) << 5 ) | 
 B16 = (( I5  >> 3 ) & 255  ) << 0 ) | 
 B17 = (( I5  >> 11 ) & 255  ) << 0 ) | 
 B18 = (( I5  >> 19 ) & 63  ) << 0 ) | (( I6  >> 0 ) & 3  ) << 6 ) | 
 B19 = (( I6  >> 2 ) & 255  ) << 0 ) | 
 B20 = (( I6  >> 10 ) & 255  ) << 0 ) | 
 B21 = (( I6  >> 18 ) & 127  ) << 0 ) | (( I7  >> 0 ) & 1  ) << 7 ) | 
 B22 = (( I7  >> 1 ) & 255  ) << 0 ) | 
 B23 = (( I7  >> 9 ) & 255  ) << 0 ) | 
 B24 = (( I7  >> 17 ) & 255  ) << 0 ) | 
=======================================================
*/



public class VectorBitPacker25 {

} // Class VectorBitPacker25

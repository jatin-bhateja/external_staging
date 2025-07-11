

//////////////////////////////////////////////////////////////////////////////////////
///////// AUTO-GENERATED PARQUET 12 BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////
//////////////////////////////////////////////////////////////////////////////////////


import jdk.incubator.vector.*;

/*
IR dump of scalar assignments with shifts and and_mask.
=======================================================
 B0 = (( I0  >> 0 ) & 255  ) << 0 ) | 
 B1 = (( I0  >> 8 ) & 15  ) << 0 ) | (( I1  >> 0 ) & 15  ) << 4 ) | 
 B2 = (( I1  >> 4 ) & 255  ) << 0 ) | 
 B3 = (( I2  >> 0 ) & 255  ) << 0 ) | 
 B4 = (( I2  >> 8 ) & 15  ) << 0 ) | (( I3  >> 0 ) & 15  ) << 4 ) | 
 B5 = (( I3  >> 4 ) & 255  ) << 0 ) | 
 B6 = (( I4  >> 0 ) & 255  ) << 0 ) | 
 B7 = (( I4  >> 8 ) & 15  ) << 0 ) | (( I5  >> 0 ) & 15  ) << 4 ) | 
 B8 = (( I5  >> 4 ) & 255  ) << 0 ) | 
 B9 = (( I6  >> 0 ) & 255  ) << 0 ) | 
 B10 = (( I6  >> 8 ) & 15  ) << 0 ) | (( I7  >> 0 ) & 15  ) << 4 ) | 
 B11 = (( I7  >> 4 ) & 255  ) << 0 ) | 
 B12 = (( I8  >> 0 ) & 255  ) << 0 ) | 
 B13 = (( I8  >> 8 ) & 15  ) << 0 ) | (( I9  >> 0 ) & 15  ) << 4 ) | 
 B14 = (( I9  >> 4 ) & 255  ) << 0 ) | 
 B15 = (( I10  >> 0 ) & 255  ) << 0 ) | 
 B16 = (( I10  >> 8 ) & 15  ) << 0 ) | (( I11  >> 0 ) & 15  ) << 4 ) | 
 B17 = (( I11  >> 4 ) & 255  ) << 0 ) | 
 B18 = (( I12  >> 0 ) & 255  ) << 0 ) | 
 B19 = (( I12  >> 8 ) & 15  ) << 0 ) | (( I13  >> 0 ) & 15  ) << 4 ) | 
 B20 = (( I13  >> 4 ) & 255  ) << 0 ) | 
 B21 = (( I14  >> 0 ) & 255  ) << 0 ) | 
 B22 = (( I14  >> 8 ) & 15  ) << 0 ) | (( I15  >> 0 ) & 15  ) << 4 ) | 
 B23 = (( I15  >> 4 ) & 255  ) << 0 ) | 
=======================================================
*/



public class VectorBitPacker12 {

} // Class VectorBitPacker12

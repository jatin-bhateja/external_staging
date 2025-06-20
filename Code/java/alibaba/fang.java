import jdk.incubator.vector.*;
import org.apache.parquet.bytes.ByteBufferInputStream;



import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;



class LemireBitUnpack7_ByteBuffer {



	public static short [] rshift_cnt_arr = {
		0,7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,
		0,7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,
	};



	public static short [] lshift_cnt_arr = {
		0,1,2,3,4,5,6,1,0,1,2,3,4,5,6,1,
		0,1,2,3,4,5,6,1,0,1,2,3,4,5,6,1,
	};



	public static short [] and_val_arr = {
		127,1,3,7,15,31,63,127,127,1,3,7,15,31,63,127,
		127,1,3,7,15,31,63,127,127,1,3,7,15,31,63,127
	};



	public static int [] perm_pos0_arr = {
		0,63,0,63,2,63,4,63,6,63,8,63,10,63,12,63,
		14,63,14,63,16,63,18,63,20,63,22,63,24,63,26,63,
		28,63,28,63,30,63,32,63,34,63,36,63,38,63,40,63,
		42,63,42,63,44,63,46,63,48,63,50,63,52,63,54,63
	};



	public static int [] perm_pos1_arr = {
		0,63,2,63,4,63,6,63,8,63,10,63,12,63,12,63,
		14,63,16,63,18,63,20,63,22,63,24,63,26,63,26,63,
		28,63,30,63,32,63,34,63,36,63,38,63,40,63,40,63,
		42,63,44,63,46,63,48,63,50,63,52,63,54,63,54,63
	};



	public static VectorShuffle<Byte> perm_mask0;
	public static VectorShuffle<Byte> perm_mask1;
	public static VectorMask<Byte> inp_mask;
	public static VectorMask<Short> or_mask;
	public static Vector<Short> rshift_cnt;
	public static Vector<Short> lshift_cnt;
	public static Vector<Short> and_vec;



	public static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_256;
	public static final VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;
	public static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;
	public static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;



	public static final int ITERS = 100000;
	public static int linputLen = 0;
	public static ByteBufferInputStream inBufferStream = null;



	// Vectorized algorithm is based on the approach of adding partial redundancies in LHS expression
	// of all other assignments except 2nd and 5th to cover up for extra shift operation in the LHS
	// expression these assignments.
	// Towards the end using predicated vector OR operation we can scrap the effect of redundancies on RHS expression
	//
	// Logic:
	// 5 bytes are feeding 8 int values.
	// by induction
	// 20 bytes can feed 32 int values (cap of 512 bit vector hit)
	// thus
	// 20 bytes can feed 32 short values (512 bit vector)
	// LHS expression of each assignment is now composed of macro expression involving shift and logical AND operations.
	// As the final step perform predicated vector OR operation to filter out redundant shifts.
	//
	// Following is the transformed version of scalar method which is easy to vectorize
	// using VectorAPIs.
	//



	public static void unpack8ValuesVectorVIEW(final byte[] in, final int inPos, final int[] out, final int outPos) {
		out[ 0 + outPos] =
			// [_6543210]
			// [6543210]
			((((int)in[ 0 + inPos]) >>0) & 127)
			|
			((((int)in[ 0 + inPos]) <<0) & 127); // OR masked off
		out[ 1 + outPos] =
			// [7_______]
			// [______0]
			((((int)in[ 0 + inPos]) >> 7) & 1)
			| // [__543210]
			// [654321_]
			((((int)in[ 1 + inPos]) << 1) & 127); // OR masked on
		out[ 2 + outPos] =
			// [76______]
			// [_____10]
			((((int)in[ 1 + inPos]) >> 6) & 3)
			| // [___43210]
			// [65432__]
			((((int)in[ 2 + inPos]) << 2) & 127); // OR masked on
		out[ 3 + outPos] =
			// [765_____]
			// [____210]
			((((int)in[ 2 + inPos]) >> 5) & 7)
			| // [____3210]
			// [6543___]
			((((int)in[ 3 + inPos]) << 3) & 127); // OR masked on
		out[ 4 + outPos] =
			// [7654____]
			// [___3210]
			((((int)in[ 3 + inPos]) >> 4) & 15)
			| // [_____210]
			// [654____]
			((((int)in[ 4 + inPos]) << 4) & 127); // OR masked on
		out[ 5 + outPos] =
			// [76543___]
			// [__43210]
			((((int)in[ 4 + inPos]) >> 3) & 31)
			| // [______10]
			// [65_____]
			((((int)in[ 5 + inPos]) << 5) & 127); // OR masked on
		out[ 6 + outPos] =
			// [765432__]
			// [_543210]
			((((int)in[ 5 + inPos]) >> 2) & 63)
			| // [_______0]
			// [6______]
			((((int)in[ 6 + inPos]) << 6) & 127); // OR masked on
		out[ 7 + outPos] =
			// [7654321_]
			// [6543210]
			((((int)in[ 6 + inPos]) >> 1) & 127)
			|
			((((int)in[ 6 + inPos]) << 1) & 127); // OR masked off
	}



	public static void unpack8Values_vec(final ByteBuffer in, final int inPos, final int[] out, final int outPos) {
		// long now = System.nanoTime();
		//System.out.println("inPos========="+inPos);
		//int a = in.limit() - B256.vectorByteSize();
		//System.out.println("inPos======"+inPos+" a:"+a+" in.limit():"+in.limit()+" B256:"+B256.vectorByteSize());
		ByteVector byteVector = ByteVector.fromByteBuffer(B256, in, inPos, ByteOrder.LITTLE_ENDIAN,inp_mask)
			.castShape(S512, 0)
			.reinterpretAsBytes();



		//long last = System.nanoTime() - now;
		//System.out.println("last=bytebuffer==========="+last);
		ShortVector tempRes1 = byteVector.rearrange(perm_mask0)
			.reinterpretAsShorts()
			.lanewise(VectorOperators.ASHR, rshift_cnt)
			.lanewise(VectorOperators.AND, and_vec);



		ShortVector tempRes2 = byteVector.rearrange(perm_mask1)
			.reinterpretAsShorts()
			.lanewise(VectorOperators.LSHL, lshift_cnt)
			.lanewise(VectorOperators.AND, S512.broadcast(127));



		tempRes1 = tempRes1.lanewise(VectorOperators.OR, tempRes2, or_mask);



		tempRes1.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
		tempRes1.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
	}




	public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {
		//long now = System.nanoTime();
		ByteVector byteVector = ByteVector.fromArray(B256, in, inPos, inp_mask)
			.castShape(S512, 0)
			.reinterpretAsBytes();
		//long last = System.nanoTime() - now;
		//System.out.println("last=byte[]==========="+last);
		ShortVector tempRes1 = byteVector.rearrange(perm_mask0)
			.reinterpretAsShorts()
			.lanewise(VectorOperators.ASHR, rshift_cnt)
			.lanewise(VectorOperators.AND, and_vec);



		ShortVector tempRes2 = byteVector.rearrange(perm_mask1)
			.reinterpretAsShorts()
			.lanewise(VectorOperators.LSHL, lshift_cnt)
			.lanewise(VectorOperators.AND, S512.broadcast(127));



		tempRes1 = tempRes1.lanewise(VectorOperators.OR, tempRes2, or_mask);



		tempRes1.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);
		tempRes1.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);
	}



	public static void unpack8Values(final ByteBuffer in, final int inPos, final int[] out, final int outPos) {
		out[ 0 + outPos] =
			// [_6543210]
			// [6543210]
			((((int)in.get( 0 + inPos)) ) & 127);
		out[ 1 + outPos] =
			// [7_______]
			// [______0]
			((((int)in.get( 0 + inPos)) >> 7) & 1)
			| // [__543210]
			// [654321_]
			((((int)in.get( 1 + inPos)) << 1) & 127);
		out[ 2 + outPos] =
			// [76______]
			// [_____10]
			((((int)in.get( 1 + inPos)) >> 6) & 3)
			| // [___43210]
			// [65432__]
			((((int)in.get( 2 + inPos)) << 2) & 127);
		out[ 3 + outPos] =
			// [765_____]
			// [____210]
			((((int)in.get( 2 + inPos)) >> 5) & 7)
			| // [____3210]
			// [6543___]
			((((int)in.get( 3 + inPos)) << 3) & 127);
		out[ 4 + outPos] =
			// [7654____]
			// [___3210]
			((((int)in.get( 3 + inPos)) >> 4) & 15)
			| // [_____210]
			// [654____]
			((((int)in.get( 4 + inPos)) << 4) & 127);
		out[ 5 + outPos] =
			// [76543___]
			// [__43210]
			((((int)in.get( 4 + inPos)) >> 3) & 31)
			| // [______10]
			// [65_____]
			((((int)in.get( 5 + inPos)) << 5) & 127);
		out[ 6 + outPos] =
			// [765432__]
			// [_543210]
			((((int)in.get( 5 + inPos)) >> 2) & 63)
			| // [_______0]
			// [6______]
			((((int)in.get( 6 + inPos)) << 6) & 127);
		out[ 7 + outPos] =
			// [7654321_]
			// [6543210]
			((((int)in.get( 6 + inPos)) >> 1) & 127);
	}




	public static void unpack8Values(final byte[] in, final int inPos, final int[] out, final int outPos) {
		out[ 0 + outPos] =
			// [_6543210]
			// [6543210]
			((((int)in[ 0 + inPos]) ) & 127);
		out[ 1 + outPos] =
			// [7_______]
			// [______0]
			((((int)in[ 0 + inPos]) >> 7) & 1)
			| // [__543210]
			// [654321_]
			((((int)in[ 1 + inPos]) << 1) & 127);
		out[ 2 + outPos] =
			// [76______]
			// [_____10]
			((((int)in[ 1 + inPos]) >> 6) & 3)
			| // [___43210]
			// [65432__]
			((((int)in[ 2 + inPos]) << 2) & 127);
		out[ 3 + outPos] =
			// [765_____]
			// [____210]
			((((int)in[ 2 + inPos]) >> 5) & 7)
			| // [____3210]
			// [6543___]
			((((int)in[ 3 + inPos]) << 3) & 127);
		out[ 4 + outPos] =
			// [7654____]
			// [___3210]
			((((int)in[ 3 + inPos]) >> 4) & 15)
			| // [_____210]
			// [654____]
			((((int)in[ 4 + inPos]) << 4) & 127);
		out[ 5 + outPos] =
			// [76543___]
			// [__43210]
			((((int)in[ 4 + inPos]) >> 3) & 31)
			| // [______10]
			// [65_____]
			((((int)in[ 5 + inPos]) << 5) & 127);
		out[ 6 + outPos] =
			// [765432__]
			// [_543210]
			((((int)in[ 5 + inPos]) >> 2) & 63)
			| // [_______0]
			// [6______]
			((((int)in[ 6 + inPos]) << 6) & 127);
		out[ 7 + outPos] =
			// [7654321_]
			// [6543210]
			((((int)in[ 6 + inPos]) >> 1) & 127);
	}



	public static int scalar_packing(byte [] in , int [] out, int ctr) {
		for(int i = 0, j = 0 ; i < in.length ; i+=7, j+=8) {
			unpack8Values(in, i, out, j);
		}
		return out[ctr];
	}
	public static int scalar_packing_byteBuffer(ByteBufferInputStream in , int [] out, int ctr) throws EOFException {



		int len = (out.length*7)/8;
		for(int i = 0, j = 0 ; i < len ; i+=7, j+=8) {
			ByteBuffer b = in.slice(7);
			unpack8Values(b, i, out, j);
		}
		return out[ctr];
	}



	public static int vector_packing(ByteBufferInputStream in , int [] out, int ctr) throws EOFException {
		int i = 0;
		int j = 0;
		int len = (out.length*7)/8 - 28;
		for(; i < len; i+=28, j+=32) {
			ByteBuffer b = in.slice(28);
			unpack8Values_vec(b, b.position(), out, j);
		}
		for(; i < (out.length*7)/8; i+=7, j+=8) {
			ByteBuffer b = in.slice(7);
			unpack8Values(b, b.position(), out, j);
		}
		return out[ctr];
	}



	public static int vector_packing(byte [] in , int [] out, int ctr) {
		int i = 0;
		int j = 0;
		for(; i < (in.length-28); i+=28, j+=32) {
			unpack8Values_vec(in, i, out, j);
		}
		//System.out.println("i============"+i);
		for(; i < in.length; i+=7, j+=8) {
			unpack8Values(in, i, out, j);
		}
		return out[ctr];
	}



	public static void main(String [] args) throws InterruptedException, IOException {
		int res = 0;
		long scalar = 0;
		int algo = Integer.parseInt(args[0]);
		//Random random = new Random();
		byte [] in = new byte[1008];
		ByteBuffer inBuffer = ByteBuffer.allocate(1008);
		int [] out = new int[1152];
		int [] out1 = new int[1152];
		linputLen = inBuffer.capacity();




		// byte [] in = new byte[1024];
		// int [] out = new int[1640];
		// int [] out1 = new int[1640];
		for(int i = 0 ; i < in.length ;i++) {
			//int v = random.nextInt(1020);
			in[i] = (byte)i;



		}
		inBuffer.put(in,0,in.length);
		inBuffer.flip();
		inBufferStream = ByteBufferInputStream.wrap(inBuffer);




		//inBufferStream.slice(10);
		//32 shorts need 32*7=224 bits
		//224bits/8 = 28 bytes
		//B256 feeds 256/8=32 bytes, so the mask is 28/32 1
		inp_mask = VectorMask.fromLong(B256, 0xfffffff);
		or_mask = VectorMask.fromLong(S512, 0x7e7e7e7e7e7e7e7eL);
		perm_mask0 = VectorShuffle.fromArray(B512, perm_pos0_arr, 0);
		perm_mask1 = VectorShuffle.fromArray(B512, perm_pos1_arr, 0);
		lshift_cnt = ShortVector.fromArray(S512, lshift_cnt_arr, 0);
		rshift_cnt = ShortVector.fromArray(S512, rshift_cnt_arr, 0);
		and_vec = ShortVector.fromArray(S512, and_val_arr, 0);
		if (algo == 0||algo == 3) {
			for (int i = 0; i < ITERS; i++) {
				//res += scalar_packing(in, out, i % out.length);
				inBufferStream.mark(0);
				res += scalar_packing_byteBuffer(inBufferStream, out, i % out.length);
				inBufferStream.reset();
				// System.out.println("scala res:"+res+" "+i%out.length);
			}
			res = 0;
			long t1 = System.currentTimeMillis();
			//long t1 = System.nanoTime();
			for (int i = 0; i < ITERS; i++) {
				inBufferStream.mark(0);
				//res += scalar_packing(in, out, i % out.length);
				res += scalar_packing_byteBuffer(inBufferStream, out, i % out.length);
				inBufferStream.reset();
			}
			//long t2 = System.nanoTime();
			long t2 = System.currentTimeMillis();
			System.out.println("[Res] " + res + " [Scalar Time7] " + (t2 - t1) + " ms");
			scalar = t2 - t1;
			//for(int i = 0 ; i < 16; i++) {
			// System.out.println("out["+i+"] = "+out[i]);
			//}
		}if (algo==1||algo==3) {
			for (int i = 0; i < ITERS; i++) {
				//inBuffer.flip();
				//res += vector_packing(in, out1, i % out.length);
				inBufferStream.mark(0);
				res += vector_packing(inBufferStream, out1, i % out.length);
				inBufferStream.reset();
			}
			res = 0;
			long t1 = System.currentTimeMillis();
			//t1 = System.nanoTime();
			for (int i = 0; i < ITERS; i++) {
				//inBuffer.flip();
				//res += vector_packing(in, out1, i % out1.length);



				inBufferStream.mark(0);
				res += vector_packing(inBufferStream, out1, i % out.length);
				inBufferStream.reset();
				//System.out.println("vector res:"+res+" "+i%out.length);
			}
			long t2 = System.currentTimeMillis();
			long vector = t2 - t1;
			//t2 = System.nanoTime();
			float re = (float)scalar/vector;
			System.out.println("[Res] " + res + " [Vector Time7] " + (t2 - t1) + " ms"+" s/v:" + re + "x");
		}
		// long now = System.nanoTime();
		// for(int i = 0; i < 10; i++) {
		// res += vector_packing(in, out1, i % out1.length);
		// //System.out.println("vector res:"+res+" "+i%out.length);
		// }
		// long last = System.nanoTime() - now;
		// long now1 = System.nanoTime();
		// for(int i = 0; i < 10; i++) {
		// res += scalar_packing(in, out, i % out.length);
		// }
		// long last1 = System.nanoTime() - now1;
		// System.out.println("v last:"+last+" s last:"+last1);



		// for(int i = 0 ; i < 1360; i++) {
		// System.out.println("out["+i+"] = "+out[i]+" "+out1[i]);
		// }
	}
}

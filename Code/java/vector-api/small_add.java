


   public Float256Vector add(Vector<Float> o) {
        Objects.requireNonNull(o);
        Float256Vector v = (Float256Vector)o;
        return VectorIntrinsics.binaryOp(
            VECTOR_OP_ADD, Float256Vector.class, float.class, LENGTH,
            this, v,
            (v1, v2) -> v1.bOp(v2, (i, a, b) -> (float)(a + b)));
    }




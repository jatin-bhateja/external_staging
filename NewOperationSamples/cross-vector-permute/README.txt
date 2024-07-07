////
////
//// Vector.selectFrom(Vector<E> v1, Vector<E> v2, VectorMask<E> selection_mask);
////  API : ARG1 INDEX_VECTOR
////      : ARG2 VECTOR
////      : ARG3 VECTOR
////      : ARG4 MASK (0:ARG2, 1:ARG3)        
////  IR Level Break Down:  
////      VectorBlend (VectorRearrange this, v1) (VectorRearrange this v2) selection_mask
////  VectorBlend::Idealization
////      Match pattern
////      if (TargetSupportCrossVectorPermute) {
////          VectorCrossVectorPermute
////      }
////      Return nullptr.
////
////

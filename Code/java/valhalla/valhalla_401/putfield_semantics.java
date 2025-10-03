
import jdk.internal.vm.annotation.*;

@LooselyConsistentValue
value class MyValue {
    public float _field1;
    public float _field2;
    public float _field3;
    public float _field4;

    public MyValue(float f1, float f2, float f3, float f4) {
        this._field1 = f1;
        this._field2 = f2;
        this._field3 = f3;
        this._field4 = f4;
    }
}

@LooselyConsistentValue
value class MyValueMF {
    @MultiField(value = 8)
    public float _payload;
    public MyValueMF() {
        _payload = 0.0f;
    }
}

public class putfield_semantics {
    // primitive field;
    public float _prim_field;
   
    // reference field;
    public Object _ref_field;

    // flat multifield backed field
    @NullRestricted
    @Strict
    public MyValueMF _flat_mf_field = new MyValueMF();
    
    // flat value field;
    @NullRestricted
    @Strict
    public MyValue _flat_value_field = new MyValue(10.0f, 20.0f, 30.0f, 40.0f);

    // non-flat value field
    public MyValue _non_flat_value_field;
   
    public void update_prim_field(float value) {
        _prim_field = value;
    } 
    
    public void update_ref_field(Object value) {
        _ref_field = value;
    } 

    public void update_on_flat_value_field(MyValue value) {
        _non_flat_value_field = value;
    } 

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[\n  ");
        sb.append("   prim_field = " + _prim_field);
        sb.append("   ref_field = " + _ref_field);
        sb.append("   flat_value_field = " + _flat_value_field);
        sb.append("   non_flat_value_field = " + _non_flat_value_field);
        return sb.toString();
    }

    public static void main(String [] args) {
        putfield_semantics obj = new putfield_semantics();
        obj.update_prim_field(10.0f);
        obj.update_ref_field(Integer.valueOf(10));
        System.out.println(obj); 
    }
} 

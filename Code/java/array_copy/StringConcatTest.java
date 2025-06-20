public class StringConcatTest {

        public static void main (String[] args) {

                final int NUM_STRS = 11;
                String[] strs = {
                                "aoiod", // 5
                                "adsdefrgda", // 10
                                "dsadsadadsdsadiomjdas", // 20
                                "djsadusahdusaufdoaaiffjdkdpjikl", // 30
                                "dsudhusuhfudhaufhduahfduafhdkaffhdjafjdfa", // 40
                                "dhsuafydagfydagfdafdajlkejwfjfuhfuafjhdahfldjksl90s", // 50
                                "dsajufhdaufhdasuifhdasjkfndasjkfgbaduygbiafjioeawjfioiopjsdljl", // 60
                                "dshaudshauidshauidhsiufhdasjklfdbnasjkvbauyvbdyargfwrheuifgeuijikalkjfds", // 70
                                "nvfjsvnfusdbvfuyafbduyasfdsjkfhdjkasfhdjksafhdjksfhdjksfhasdjkncxsvnxcm,fdjklfjdkf", // 80
                                "fdhuafdhasuifhdasuigbdjkbvcjksbdfhduasfhduasifhdasjkfhdasjkfhdjklasfoeurieoiruwiowurieoureik", // 90
                                "dshfudahfduiashfduiasnvdjkvnuiarheuirheiodfhdjksafhuiheuiafheaskfdhjkasfhdjkashfdjkashfdjkasuipiuk890f", // 100
                };

                StringBuffer strBuf = new StringBuffer("");

                int iter = Integer.parseInt(args[0]);
            for (int i = 0; i < 10000; i++) {
           foo(NUM_STRS, iter, strs);
        }
        }

    static StringBuffer foo(int NUM_STRS, int iter, String[] strs) {
      StringBuffer strBuf = new StringBuffer(""); 
      for (int outInd = 0; outInd < NUM_STRS; outInd++) {
         for (int innInd = 0; innInd < iter; innInd++) {
            strBuf.append(strs[outInd]);
         }
      }
      return strBuf;
    }
}

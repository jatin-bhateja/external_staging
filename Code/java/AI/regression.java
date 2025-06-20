
/*
  Dataset:
    wget https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv


  Compile:
     javac  -cp /home/jatinbha/sandboxes/tribuo/Json/target/tribuo-json-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Data/target/tribuo-data-4.2.0-SNAPSHOT.jar:/home/jatinbha/sandboxes/tribuo/Regression/XGBoost/target/tribuo-regression-xgboost-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Regression/LibLinear/target/tribuo-regression-liblinear-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Regression/SGD/target/tribuo-regression-sgd-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Regression/RegressionTree/target/tribuo-regression-tree-4.2.0-SNAPSHOT-jar-with-dependencies.jar regression.java 
  
  Run:
    java  -cp /home/jatinbha/sandboxes/tribuo/Json/target/tribuo-json-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Data/target/tribuo-data-4.2.0-SNAPSHOT.jar:/home/jatinbha/sandboxes/tribuo/Regression/XGBoost/target/tribuo-regression-xgboost-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Regression/LibLinear/target/tribuo-regression-liblinear-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Regression/SGD/target/tribuo-regression-sgd-4.2.0-SNAPSHOT-jar-with-dependencies.jar:/home/jatinbha/sandboxes/tribuo/Regression/RegressionTree/target/tribuo-regression-tree-4.2.0-SNAPSHOT-jar-with-dependencies.jar regression.java 
*/

import java.nio.file.Path;
import java.nio.file.Paths;

import org.tribuo.*;
import org.tribuo.data.csv.CSVLoader;
import org.tribuo.datasource.ListDataSource;
import org.tribuo.evaluation.TrainTestSplitter;
import org.tribuo.math.optimisers.*;
import org.tribuo.regression.*;
import org.tribuo.regression.evaluation.*;
import org.tribuo.regression.sgd.RegressionObjective;
import org.tribuo.regression.sgd.linear.LinearSGDTrainer;
import org.tribuo.regression.sgd.objectives.SquaredLoss;
import org.tribuo.regression.rtree.CARTRegressionTrainer;
import org.tribuo.regression.xgboost.XGBoostRegressionTrainer;
import org.tribuo.util.Util;

public class regression {

  public static Model<Regressor> train(String name, Trainer<Regressor> trainer, Dataset<Regressor> trainData) {
       // Train the model
       System.out.println("Model training start");
       var startTime = System.currentTimeMillis();
       Model<Regressor> model = null;
       for (int i = 0 ; i < 10000; i++) {
          model = trainer.train(trainData);
       }
       
       var endTime = System.currentTimeMillis();
       //System.out.println("Training " + name + " took " + Util.formatDuration(startTime,endTime));
       // Evaluate the model on the training data
       // This is a useful debugging tool to check the model actually learned something
       RegressionEvaluator eval = new RegressionEvaluator();
       var evaluation = eval.evaluate(model,trainData);
       // We create a dimension here to aid pulling out the appropriate statistics.
       // You can also produce the String directly by calling "evaluation.toString()"
       var dimension = new Regressor("DIM-0",Double.NaN);
       //System.out.printf("Evaluation (train):%n  RMSE %f%n  MAE %f%n  R^2 %f%n",
       //        evaluation.rmse(dimension), evaluation.mae(dimension), evaluation.r2(dimension));
       System.out.println("Model training complete");
       return model;
   }

   public static void evaluate(Model<Regressor> model, Dataset<Regressor> testData) {
       // Evaluate the model on the test data
       RegressionEvaluator eval = new RegressionEvaluator();
       var evaluation = eval.evaluate(model,testData);
       // We create a dimension here to aid pulling out the appropriate statistics.
       // You can also produce the String directly by calling "evaluation.toString()"
       var dimension = new Regressor("DIM-0",Double.NaN);
       //System.out.printf("Evaluation (test):%n  RMSE %f%n  MAE %f%n  R^2 %f%n",
       //        evaluation.rmse(dimension), evaluation.mae(dimension), evaluation.r2(dimension));
   }

   public static void main (String [] args) {
       try {
          var regressionFactory = new RegressionFactory();
          var csvLoader = new CSVLoader<>(';',regressionFactory);

          var wineSource = csvLoader.loadDataSource(Paths.get("./winequality-red.csv"),"quality");
          var splitter = new TrainTestSplitter<>(wineSource, 0.7f, 0L);
          Dataset<Regressor> trainData = new MutableDataset<>(splitter.getTrain());
          Dataset<Regressor> evalData = new MutableDataset<>(splitter.getTest());
        
          Regressor r = trainData.getExample(0).getOutput();
          System.out.println("Num dimensions = " + r.size());
          
          String[] dimNames = r.getNames();
          System.out.println("Dimension name: " + dimNames[0]);
          
          double[] regressedValues = r.getValues();
          System.out.println("Dimension value: " + regressedValues[0]);
          
          // getDimension(String) returns an Optional<DimensionTuple>
          Regressor.DimensionTuple tuple = r.getDimension("DIM-0").get();
          System.out.println("Tuple = [" + tuple +"]");
          
          // getDimension(int) throws IndexOutOfBoundsException if you give it a negative index
          // or one greater than or equal to r.size()
          Regressor.DimensionTuple tupleI = r.getDimension(0);
          System.out.println("Regressor[0] = " + tupleI);
   
         var lrsgd = new LinearSGDTrainer(
             new SquaredLoss(), // loss function
             SGD.getLinearDecaySGD(0.01), // gradient descent algorithm
             10,                // number of training epochs
             -1,// logging interval
             //trainData.size()/4,// logging interval
             1,                 // minibatch size
             1L                 // RNG seed
         );

//         var lrada = new LinearSGDTrainer(
//             new SquaredLoss(),
//             new AdaGrad(0.01),
//             10,
//             -1,
//             //trainData.size()/4,// logging interval
//             1,
//             1L 
//         );

//         var cart = new CARTRegressionTrainer(6);
//         var xgb = new XGBoostRegressionTrainer(50);

         var lrsgdModel = train("Linear Regression (SGD)",lrsgd,trainData);
         evaluate(lrsgdModel,evalData);
 
//         var lradaModel = train("Linear Regression (AdaGrad)",lrada,trainData);
//         evaluate(lradaModel,evalData);
   
//         var cartModel = train("CART",cart,trainData);
//         evaluate(cartModel,evalData);
   
//         var xgbModel = train("XGBoost",xgb,trainData);
//         evaluate(xgbModel,evalData);

      } catch (Exception e) {
         System.out.println("Exception " + e);
      }
   }
}


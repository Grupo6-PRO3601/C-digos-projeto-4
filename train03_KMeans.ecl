IMPORT $;
IMPORT ML_Core;
IMPORT KMeans;

TrainAttr := $.convert02.MyTrainAttrNF;

Centroids := TrainAttr(id IN [3,116,591,2036,2299]);

Max_iterations := 20;
Tolerance :=0;
Pre_Model := KMeans.KMeans(Max_iterations, Tolerance);

MyModel := Pre_Model.Fit(TrainAttr, Centroids);

Iterations := KMeans.KMeans().Iterations(MyModel);
OUTPUT(Iterations,NAMED('Iterations'));
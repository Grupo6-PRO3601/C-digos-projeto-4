import $;
import ml_core;
import dbscan;

trainattr := $.convert02.mytrainattrNF;

mymodel := dbscan.dbscan(2,100).fit(trainattr);
// numcluster: 1;     numoutliers: 12;    SilhouetteScore: 0.47;

// mymodel := dbscan.dbscan(4,4).fit(trainattr);
// numcluster: 3;     numoutliers: ?;    SilhouetteScore: 0.7;


// mymodel := dbscan.dbscan(1,200).fit(trainattr); 
// numcluster: 1;     numoutliers: 453;    SilhouetteScore: 0.48;


output(mymodel,all,named('model'));
output(mymodel(label=0),named('outliers'));

numclusters := dbscan.dbscan().num_clusters(mymodel);
output(numclusters,named('numclusters'));

numoutliers := dbscan.dbscan().num_outliers(mymodel);
output(numoutliers,named('numoutliers'));

SSS := ML_core.Analysis.Clustering.SilhouetteScore(trainattr,mymodel);
output(sss,named('analysis')); 
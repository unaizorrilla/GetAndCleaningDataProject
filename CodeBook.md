##Code Book

run_analysis.R

 * This script download data from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 * This data contains two data sets traingin and test that is merged into only one dataset
  + Feature names can be located at features.txt
  + Features and Subjects for this dataset is ont Y_training.txt and Y_test.txt.
 * The script filter only variables with mean or std values
 * The script group by subject and perform a mean for all previous variables
 * At the end write the new tidy dataset into a file, tidy.txt

# Classifying White Wine Based on Data from Physicochemical Tests  
## MEMBERS  
- Kashish Joshipura  
- Peter Lee  
- Eric Huang  
## About  
In this project, we attempt to build a classification model using the k-nearest neighbour algorithm to classify the wine only based on the physicochemical variable. This model can help the wine rating association or connoisseur understand the relationship between physicochemical and sensory factors better and thus determine the rating of the wine more accurately or more objectively.

The data set used in this project is made up of 12 characteristics of the Portuguese "Vinho Verde" wine collected during October 2009 from the Wine Quality Data Set.

## Report  
The analysis file can be found [here](notebooks/white_wine_analysis.html)

We have also provided the [.ipynb](notebooks/white_wine_analysis.ipynb) and [.rmd](notebooks/white_wine_analysis.rmd) version of our analysis

## Run  
We use the Docker container to make the computational environment for this project reproducible. There are two ways to run this project, as follows:

First, clone this GitHub repository by pasting the following block into the terminal.
```
https://github.com/kashish1928/dsci-310-group-02.git  
```
and then, in the terminal, navigate to the root of this project.

### 1. Reproducibly execute the project non-interactively.  

In order to run this type the following command in the terminal :
```
docker run --rm -it -v "/${PWD}:/home/rstudio/project" -p 8787:8787 -e PASSWORD=00000 kashish1909/dsci-310-group-02:latest
```

Then go to your preferred browser and navigate to
```
http://localhost:8787
```
You will be prompted to enter the credentials :
```
- USERNAME = rstudio
- PASSWORD = 00000
```
You will now be able to see the project under /home/rstudio/project
To be able to view the analysis file (white_wine_analysis.rmd) in a readable format:
- select white_wine_analysis.rmd 
- make sure it's set to a R Markdown file
- select the knit option at the top in order to view our analysis


### 2. Using Make
Firstly, make sure that you are in the directory containing the [makefile](Makefile) in your terminal

Next, run the command 
```
make
```
If you want to reset your work, run 
```
make clean
```
If the first command doesn't work then you can run 
```
make -B all
```
this will rebuild all targets regardless of whether they are up-to-date or not

## Dependencies  


| Package Name | Version |
|--------------|---------|
| Python | 3.9.10 |
| R | 4.1.1 |
| tidyverse | 1.3.1 |
| tidymodels | 0.1.4 |
| testthat| 3.1.6 |
| kknn | 1.3.1 |
|repr |1.1.4 |
|ggplot2| 3.3.6 |
| GGally | 2.1.2 |
|knitr| 1.38 |
|devtools| 2.4.5|
|bookdown|0.33|
|docopt|0.7.1|
|tinytex|0.44|
## License Information  
The software provided in this project is offered under the [MIT](https://opensource.org/license/mit/) open source license and [CC-BY](https://creativecommons.org/about/cclicenses/#:~:text=CC%20BY%3A%20This%20license%20allows,license%20allows%20for%20commercial%20use.). See [LICENSE.md](LICENSE.md) for more information.

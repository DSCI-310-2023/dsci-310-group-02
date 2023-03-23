
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

### 1. Reproducibly execute the project non-interactively.  
First, clone this GitHub repository by pasting the following block into the terminal.
```
https://github.com/kashish1928/dsci-310-group-02.git  
```
and then, in the terminal, navigate to the root of this project.

```
Now, in order to run this type the following command in the terminal :
```
docker run --rm -p 8787:8787 -e PASSWORD=00000  -v /$(pwd):/home/rstudio/project dsci-310-group-02
```

Then go to your preferred browser and navigate to
```
http://localhost:8787
```
You will be prompted to enter the credentials :
- USERNAME = rstudio
- PASSWORD = 00000

You will now be able to see the project under /home/rstudio/project
To be able to view the analysis file (white_wine_analysis.rmd) in a readable format:
- select white_wine_analysis.rmd 
- make sure it's set to a R Markdown file
- select the knit option at the top in order to view our analysis

### 2. Reproducibly execute the project non-interactively.  
In the terminal, navigate to the root of this project repository.

Type the following in the terminal:
```
docker-compose up -d  
```
- Once the container has launched, users need to type in "http://localhost:8787" in their preferred browser in order to launch a rstudio project.

- Next, in rstudio, navigate to projects directory, and open white_wine_analysis.html or white_wine_analysis.rmd

- When done working, type docker-compose down to remove the dangling container.

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
## License Information  
The software provided in this project is offered under the MIT open source license. See LICENSE.md for more information.

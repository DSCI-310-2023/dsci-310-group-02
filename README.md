
# Classifying White Wine Based on Data from Physicochemical Tests  
## MEMBERS  
- Kashish Joshipura  
- Peter Lee  
- Eric Huang  
## About  
In this project, we attempt to build a classification model using the k-nearest neighbour algorithm to classify the wine only based on the physicochemical variable. This model can help the wine rating association or connoisseur understand the relationship between physicochemical and sensory factors better and thus determine the rating of the wine more accurately or more objectively.

The data set used in this project is made up of 12 characteristics of the Portuguese "Vinho Verde" wine collected during October 2009 from the Wine Quality Data Set.

## Report  
The analysis file can be found [here](white_analysis.ipynb)

## Run  
We use the Docker container to make the computational environment for this project reproducible. There are two ways to run this project, as follows:

### 1. Reproducibly execute the project non-interactively.  
First, clone this GitHub repository by pasting the following block into the terminal.
```
https://github.com/kashish1928/dsci-310-group-02.git  
```
and then, in the terminal, navigate to the root of this project.

Next, pull the Docker image (make sure you have Docker Desktop open when using any Docker commands on the terminal) using:
```
docker pull kashish1909/dsci-310-group-02:latest  
```
Then run the following in your terminal:
```
docker run --rm \  
-p 8888:8888 \  
-v /$(pwd):/opt/dsci-310-group-02 \  
kashish1909/dsci-310-group-02  
```
### 2. Reproducibly execute the project non-interactively.  
In the terminal, navigate to the root of this project repository.

Type the following in the terminal:
```
docker-compose up -d  
```
- Once the container has launched, users need to copy the URL that looks like http://127.0.0.1:8888/lab?token=... into their web browser to access Jupyter Lab.

- Next, in Jupyter Lab, navigate to, and open white_analysis.ipynb and click Kernel > Restart and runall to run the entire analysis.

- When done working, type docker-compose down to remove the dangling container.

## Dependencies  


| Package Name | Version |
|--------------|---------|
| Python | 3.9.10 |
| R | 4.1.1 |
| tidyverse | 1.3.1 |
| tidymodels | 0.1.4 |

## License Information  
The software provided in this project is offered under the MIT open source license. See LICENSE.md for more information.

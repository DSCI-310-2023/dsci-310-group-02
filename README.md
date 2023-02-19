# Classifying White Wine Based on Data from Physicochemical Tests 

## MEMBERS
- Kashish Joshipura
- Peter Lee
- Eric Huang

## About
In this project, we attempt to build a classification model using the k-nearest neighbor algorithm to classify the wine only based on the physicochemical variable. This model can help the wine rating association or connoisseur understand the relationship between physicochemical and sensory factors better, and thus determine the rate of the wine more accurately or more objectively.  
<br>
The data set used in this project is 12 characteristics of the Portuguese "Vinho Verde" wine collected during Oct., 2009 from [Wine Quality Data Set](https://archive.ics.uci.edu/ml/datasets/wine+quality).

## Report
The analysis file can be found [here](white_analysis.ipynb).

## Run
We use the Docker container to make the computational environment for this project reproducilbe. There are two ways to run this project as following.  
### 1. Reproducibly excute the project non-interactively
First, clone this GitHub repository and in the terminal, navigate to the root of this project.
Then run the following in your terminal:

```
docker run --rm \
  -p 8888:8888 \
  -v /$(pwd):/opt/dsci-310-group-02 \
  kashish1909/dsci-310-group-02
```

### 2. Reproducibly excute the project non-interactively

- In terminal, navigate to the root of this project repository
- Type the following in terminal:

  ```
  docker-compose up -d
  ```
- Once the container has launched, users need to copy the URL that looks like `http://127.0.0.1:8888/lab?token=...` into their web browser to access Jupyter Lab
- Next, in Jupyter lab, navigate to, and open `white_analysis.ipynb` and click **Kernel** > **Restart and runall** to run the entire analysis.
- When done working, type `docker-compose down` to remove the dangling container.

## Dependencies
R version 4.1.1, Jupyter and R packages listed in [white_analysis.ipynb](white_analysis.ipynb).

## License Information
The software provided in this project is offered under the [MIT open source license](https://opensource.org/licenses/MIT). See [LICENSE.md](LICENSE.md) for more information. 



# PySpark Notebook

This extends the jupyter/pyspark-notebook Docker container and adds some
additional Python packages, image processing support (in the form of
system libraries and headers as well as Python packages), and example
notebooks.

### Running the Notebook

##### Basic Usage

For normal execution, simply start the container and expose the http port:

> bash> docker run -d -p 8888:8888 brillozon/pyspark-nb

Then point your browser to the location:

> bash> chrome http://localhost:8888/

##### Advanced Usage

If you want to experiment with adding additional packages and
capabilities, this is easily done by opening a terminal window from the
home page and performing:

> bash> pip install &lt;packagename&gt;

If you need to install system packages to experiment with, you can do
this, but will need to start the notebook with sufficient priveledges:

> bash> docker run -d -p 8888:8888 -e GRANT\_SUDO=yes --user root brillozon/pyspark-nb

This will allow you to install system packages from the terminal by using
'sudo'.  For example, to insall the GDAL libraries and Python bindings:

> bash> sudo apt-get update ; sudo apt-get install libgdal1-dev libgdal1h python-gdal 

Once you have these working as expected, you may want to extend the
Dockerfile and add this installation to the image rather than performing
these steps each time you start the container.

### Included Notebooks

* introduction - basics of importing and configuring the PySpark module.
* simple-tree - reads a dataset from the web, trains a decision tree model, and evaluates the results.


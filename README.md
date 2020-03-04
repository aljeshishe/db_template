# Template project

This is template for sqlachemy+pymysql+alembic projects

## Quickstart
Check everything works
    
    ./test.sh
    
Create conda environment

    conda env create -f requirements.yaml -p ./env

Create database

    python db.py create

Create first database revision from model.py

    python db.py alembic revision --autogenerate -m "comment"

Do migrations

    python db.py alembic upgrade head

Check that we can add records to db

    python db.py alembic test

Drop database

    python db.py drop


We will need to set up our system with the necessary software: this includes Python 3 and other
utilities.


### Configure the Python environment

We use [Miniconda](https://docs.conda.io/en/latest/miniconda.html) as our reference Python
environment. Anaconda is also fine but it tends to be too heavy, so use Miniconda if this is a new
installation.

Once this is installed, open a command prompt. You can use **Terminal** on macOS, or the **Command
Prompt** on Windows. We need to create a Conda Virtual Environment for IMM. This is done by typing:

    conda create --name=imm python=3.7

We are basically telling Conda to create an environment for IMM called `imm`, using Python 3.7. The
environment will be activated by typing:

    conda activate imm

and you will notice that your command prompt will have `(imm)` prepended.


### Get the code from Git

You may have difficulties downloading this project from VSCode directly because of P&G's two-factor
authentication. It is recommended that you clone the project from the command prompt (configure the
one integrated in VSCode to be Command Prompt on Windows):

    git clone https://github.com/procter-gamble/ds-cf-imm-ru

and follow the instructions on the terminal. This needs to be done only once.


### Configure VSCode

We recommend you use [VSCode](https://code.visualstudio.com/) as your development environment both
on Windows and macOS. Once installed, you need to install the Python plugin.

Open the project folder from VSCode. As soon as you open any Python file, the Python plugin will be
loaded. On the status bar at the bottom you will find a notification to select the proper Python
interpreter - select the one from Conda called `imm`.


### Install the package for development

Install the package in local development from the terminal (integrated one from VSCode is fine):

    pip install -e ".[devel]"


## Project structure

The project is structured in a proper tree of Python modules. Make sure modules, executables and
data files fall inside the appropriate directory.

All executables stored in the `src/imm/exe` directory will also result in an automatically created
executable added to your `$PATH`. Once pip-installed, you can either run:

    src/imm/exe/hello_world.py   # original script
    imm-hello-world              # automatically created

```
.
├── src                      # all source code is here
│   └── imm                  # imm is the main module (`import imm`)
│       ├── data             # data files (xlsx, csv, json...)
│       └── exe              # Python executable scripts
├── notebooks                # Python notebooks
├── requirements.txt         # project dependencies
├── requirements-devel.txt   # additional project dependencies for local development
├── cw                       # automatic testing on GitHub, leave it alone
├── setup.py                 # used when pip-installing
├── output                   # (not on Git) default directory for output files
└── test                     # (not on Git) your local virtual environment
```


## Automatic tests

This project comes with an automated testing suite. It is configured to run the suite automatically
on GitHub. Tests can also be run locally.


### Flake8 linter

Code quality can be checked using the Flake8 linter. Run it from the toplevel directory of your
repository:

    flake8 src/


### Black formatter

The Black formatter will help you reformatting your code in case you have plenty of Flake8 errors,
expecially when you are importing Python files that were never checked before into this repository.
Run Black on specific files:

    black src/module/my_file.py

Black will modify your file in place, so you may want to commit it before in case you want to revert
the changes.


### Tests and code coverage

Run all tests with:

    test/coverage.sh [--run-verylong]

This will also produce a code coverage report. Code coverage tells you how many lines of code were
effectively used during the tests. A healthy code has a very high code coverage, meaning that most
of the source code is actually being tested.

`pytest` scans for all available tests. It searches for Python files starting with `test_` and for
functions starting with `test_`. Some functions in the source code have a decorator:

```py
@pytest.mark.verylong
def test_something_very_long(monkeypatch):
    ...
```

Those tests will be skipped by default by `test/coverage.sh`. Run with the optional `--run-verylong`
argument to run those tests as well.

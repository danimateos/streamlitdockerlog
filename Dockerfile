FROM continuumio/miniconda3

WORKDIR /zeitgeist

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "zeitgeist", "/bin/bash", "-c"]

# The code to run when container is started:
COPY app.py .
CMD streamlit run app.py

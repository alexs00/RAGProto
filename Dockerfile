# Start with the Python image
FROM python:3.12

# Set the working directory
WORKDIR /webapp


# running requirements- requirements file provide all necessary library
# with version that could enable building up the docker
COPY requirements.txt .


RUN pip install -r requirements.txt 


# Copy the Python notebook
COPY rag_proto.ipynb .

COPY test_docs/guide_to_breeding_your_dog.pdf test_docs/guide_to_breeding_your_dog.pdf
COPY test_docs/bad_pdf.pdf test_docs/bad_pdf.pdf

# Expose the port Jupyter will run on
EXPOSE 8888

# Command to run your Gradio app
CMD ["jupyter", "notebook", "rag_proto.ipynb", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
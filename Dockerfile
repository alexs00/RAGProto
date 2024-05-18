# Start with the Python 3.9 image
FROM python:3.10


# Set the working directory to /Chatbot
WORKDIR /webapp


# running requirements- requirements file provide all necessary library with version that could enable building up the docker
COPY requirements.txt .


RUN pip install -r requirements.txt 


# Copy the Python script generated from your notebook
COPY webapp.py .


# Expose the port Gradio will run on, assuming 7860 (default Gradio port)
EXPOSE 7860
EXPOSE 6333
EXPOSE 1234
# Command to run your Gradio app
CMD ["python", "webapp.py"]


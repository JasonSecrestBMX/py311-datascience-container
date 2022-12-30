# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.11

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN echo "installing requirements.txt file on `date`" >> requirements.history
RUN python -m pip install -r requirements.txt
RUN ./update_requirements_history.sh

WORKDIR /workspace
COPY . /workspace

# Creates a non-root user with an explicit UID and adds permission to access the /workspace folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /workspace
USER appuser

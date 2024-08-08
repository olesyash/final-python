FROM python:3.7

WORKDIR /usr/src/app

RUN pip install --no-cache-dir pipenv

# Copy Pipfile and Pipfile.lock first to leverage Docker cache
COPY Pipfile Pipfile.lock ./

# Install dependencies
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code
COPY . .

EXPOSE 5000
# Run your application
CMD ["pipenv", "run", "python", "app.py"]

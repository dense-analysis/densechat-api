FROM python:3.11

WORKDIR /code

COPY ./pyproject.toml /code/pyproject.toml
COPY ./poetry.lock /code/poetry.lock
COPY ./poetry.txt /code/poetry.txt

RUN pip install --no-cache-dir -r poetry.txt
RUN poetry config virtualenvs.create false
RUN poetry install --only main

# Copy project directories after installation to use caching.
COPY ./densechat_api /code/densechat_api

EXPOSE 8000
CMD ["uvicorn", "densechat_api.api:app", "--host", "0.0.0.0", "--port", "8000"]

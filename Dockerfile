# Bazowy obraz
FROM python:3.9

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików aplikacji
COPY app.py /app

# Instalacja zależności
RUN pip install Flask

# Uruchomienie aplikacji
CMD ["python", "app.py"]

# Nasłuchiwanie na porcie 5000
EXPOSE 24000

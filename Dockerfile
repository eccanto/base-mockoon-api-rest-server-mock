FROM mockoon/cli:6.0.1

WORKDIR /app/

ADD examples/ .

CMD [ "--port", "3000", "--data", "jwt_users/mock_data.json" ]

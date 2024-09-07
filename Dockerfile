FROM alpine:latest AS unzipper
RUN apk add unzip curl
RUN curl -L https://content.minetest.net/packages/Wuzzy/mineclone2/releases/25617/download/ > mineclone.zip
RUN unzip mineclone.zip

FROM  warr1024/minetestserver
COPY  --from=unzipper /mineclone2 /app/minetest/games/mineclone2/

EXPOSE 30000/udp
ENTRYPOINT [ "/bin/sh", "/app/entry.sh", "--gameid", "mineclone2" ]

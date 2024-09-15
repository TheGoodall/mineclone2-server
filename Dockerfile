FROM alpine:latest AS unzipper
RUN apk add unzip curl
RUN curl -L https://content.minetest.net/packages/Wuzzy/mineclone2/releases/25617/download/ > mineclone.zip
RUN unzip mineclone.zip


FROM  ghcr.io/linuxserver/minetest:5.9.0-ls157
ENV CLI_ARGS --gameid mineclone2
COPY  --from=unzipper /mineclone2 /config/.minetest/games/mineclone2/

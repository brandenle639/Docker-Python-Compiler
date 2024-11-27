# syntax=docker/dockerfile:1
FROM pythonbuilder:{Version You Used}
COPY python{Version}.sh /python{Version}.sh
RUN ./python{Version}.sh

FROM debian:bookworm-slim
COPY --from=0 /tmp/pybuilt /built
RUN apt-get update && apt install libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev libtk8.6 libgdm-dev libdb4o-cil-dev libpcap-dev -y
RUN cp -r -u -v  /built/usr/* /usr && rm -rf /var/cache/apt/archives /var/lib/apt/lists/* /var/cache/apt/archives /built && apt-get clean
RUN ln -s /usr/local/bin/python{Version} /usr/local/bin/python{Version} && ln -s /usr/local/bin/python{Version} /usr/local/bin/python && ln -s /usr/local/bin/pip{Version} /usr/local/bin/pip{Version} && ln -s /usr/local/bin/pip{Version} /usr/local/bin/pip && ln -s /usr/local/bin/pydoc{Version} /usr/local/bin/pydoc && ln -s /usr/local/bin/idle{Version} /usr/local/bin/idle && ln -s /usr/local/bin/python{Version}-config /usr/local/bin/python-config || true
RUN useradd -rm -d /home/py -s /bin/bash -u 1000 py
USER py
RUN mkdir -p ~/.config/pip/ && echo "[global]" > ~/.config/pip/pip.conf && echo "break-system-packages = true" >> ~/.config/pip/pip.conf

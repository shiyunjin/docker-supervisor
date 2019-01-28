FROM debian

RUN \
	apt-get update && \
	apt-get install -y supervisor && \
	# 用完包管理器后安排打扫卫生可以显著的减少镜像大小
	apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN \
	mkdir -p /app

WORKDIR /app

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

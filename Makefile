all:

install: uninstall
	cp tt /usr/local/bin/ && \
		mkdir -p /usr/local/share/tarantino && \
		cp -f docker-compose.yml /usr/local/share/tarantino/docker-compose.yml && \
		cp -r grafana /usr/local/share/tarantino && \
		cp -r kibana /usr/local/share/tarantino && \
		cp -r dynamo /usr/local/share/tarantino && \
		cp -f tt_completion /usr/local/share/tarantino && \
		cp -f tt_completion_hook.bash /etc/bash_completion.d/ && \
		./tt install && \
		./tt manage pull && \
		echo Installation complete. && \
		echo Press enter to continue.

uninstall:
	echo NOTE: about to use global Tarantino to destroy existing containers, ignore the one warning below.; \
		tt destroy; \
		rm -f /usr/local/bin/tt && \
		rm -rf /usr/local/share/tarantino && \
		rm -f /usr/bin/tt && \
		rm -rf /usr/share/tarantino && \
		rm -f /etc/bash_completion.d/tt_completion_hook.bash

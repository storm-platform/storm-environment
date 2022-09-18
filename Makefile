# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Storm Platform
#
# Storm Environment is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.

.PHONY: up start stop down help logs

#
# Definitions
#

# Utility
BASE_COMMAND = docker-compose -f docker-compose.yml -f docker-compose.full.yml $(COMMAND)

#
# Execution commands
#
up:    ## Create and start containers
	mkdir -p config/nginx/log/
	> config/nginx/log/error.log
	> config/nginx/log/access.log

	$(BASE_COMMAND) up -d

start:    ## Start services
	$(BASE_COMMAND) start

stop:    ## Stop services
	$(BASE_COMMAND) stop

down:    ## Stop and remove containers, networks
	$(BASE_COMMAND) down

	rm -rf config/nginx/log

#
# Logs
#
logs:    ## View output from containers
	@echo "Getting the bundle logs"
	$(BASE_COMMAND) logs -f --tail 100


#
# Documentation function (thanks for https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
#
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

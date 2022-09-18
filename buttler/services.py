# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Storm Platform
#
# Storm Environment is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.

import sys


def idle_culler_service():
    """IDLE culler Jupyter service definition."""
    return {
        "name": "idle-culler",
        "admin": True,
        "command": [
            sys.executable,
            "-m",
            "jupyterhub_idle_culler",
            "--timeout=3600",
        ],
    }

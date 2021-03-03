from starlette.routing import Route

from monopoly.healthcheck.views import ping

routes = [
    Route('/ping', ping),
]

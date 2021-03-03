from starlette.applications import Starlette

from monopoly.routes import routes
from simple_settings import settings

app = Starlette(debug=settings.DEBUG, routes=routes)

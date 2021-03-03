from starlette.applications import Starlette

from monopoly.routes import routes
from simple_settings import settings


from tortoise import Tortoise


async def init_db():
    # Here we create a SQLite DB using file "db.sqlite3"
    #  also specify the app name of "models"
    #  which contain models from "app.models"
    await Tortoise.init(
        db_url=settings.DATABASE_URL,
        modules={'models': []}
    )
    # Generate the schema
    await Tortoise.generate_schemas()


async def close_db():
    await Tortoise.close_connections()

app = Starlette(
    debug=settings.DEBUG,
    routes=routes,
    on_startup=[init_db],
    on_shutdown=[close_db]
)

from starlette.responses import PlainTextResponse


async def ping(request):
    return PlainTextResponse('Hello, world!')

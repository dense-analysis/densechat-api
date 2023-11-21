from fastapi import FastAPI
from starlette.responses import RedirectResponse

app = FastAPI(
    title="densechat",
    description="The Densechat API.",
    version="0.1.0",
)


# Redirect / to /docs to make life easier for developers.
@app.get('/', include_in_schema=False)
async def index_view() -> RedirectResponse:
    return RedirectResponse('/docs', 302)

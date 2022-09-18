from fastapi import FastAPI


app = FastAPI()


from routers import login
from routers import game
from routers import mypage
from utils.response import response


app.include_router(login.router)
app.include_router(game.router)
app.include_router(mypage.router)


@app.get('/')
def init():
    return response(200, {}, 'GoldPigDream, Hello!')

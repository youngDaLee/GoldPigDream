from fastapi import FastAPI


app = FastAPI()


from routers import login
from routers import lotto
from routers import mypage
from utils.response import response


app.include_router(login.router)
app.include_router(lotto.router)
app.include_router(mypage.router)


@app.get('/')
def init():
    return response(200, {}, 'hello!')
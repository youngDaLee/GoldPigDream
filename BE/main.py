from fastapi import FastAPI


app = FastAPI()


from utils.response import response


@app.get('/')
def init():
    return response(200, {}, 'hello!')
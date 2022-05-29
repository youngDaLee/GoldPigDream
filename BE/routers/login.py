from fastapi import APIRouter
from utils.response import response


router = APIRouter(
    prepfix='login',
    tags=['login'],
    response=response(404)
)

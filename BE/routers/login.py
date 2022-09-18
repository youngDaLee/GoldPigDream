from fastapi import APIRouter
from utils.response import response


router = APIRouter(
    prefix='/login',
    tags=['login'],
    responses=response(404),
)

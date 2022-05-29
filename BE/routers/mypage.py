from fastapi import APIRouter
from utils.response import response


router = APIRouter(
    prepfix='mypage',
    tags=['mypage'],
    response=response(404)
)

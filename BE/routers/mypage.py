from fastapi import APIRouter
from utils.response import response


router = APIRouter(
    prefix='/mypage',
    tags=['mypage'],
    responses=response(404)
)

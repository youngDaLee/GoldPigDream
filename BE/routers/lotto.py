from fastapi import APIRouter
from utils.response import response


router = APIRouter(
    prepfix='lotto',
    tags=['lotto'],
    response=response(404)
)

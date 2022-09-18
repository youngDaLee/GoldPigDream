from typing import Union
from fastapi import APIRouter
from fastapi import Header
from pydantic import BaseModel
from utils.response import response


router = APIRouter(
    prefix='/game',
    tags=['game'],
    responses=response(404),
)

class EnterLottoNumItem(BaseModel):
    lotto_num:str
    is_auto:int


@router.post('/enter-lottonum', response_model=EnterLottoNumItem)
def enter_lottonum(
    user_agent: Union[str, None] = Header(default=None)
):

    return response(200)
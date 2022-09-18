from fastapi.responses import JSONResponse

message_table = {
    200: 'success',
    404: 'not found',
    500: 'internal server error',
}


def response(status, data={}, message=None):
    if not message:
        message = message_table[status]

    return JSONResponse(
        status_code=status,
        content={
            'status_code': status,
            'data': data,
            'message': message,
        }
    )
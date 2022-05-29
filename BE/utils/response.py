message_table = {
    200: 'success',
    404: 'not found',
    500: 'internal server error',
}


def response(status, data={}, message=None):
    if not message:
        message = message_table[status]

    return {
        'status': status,
        'message': message,
        'data': data
    }
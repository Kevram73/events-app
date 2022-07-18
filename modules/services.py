# Token for api
from functools import wraps

import jwt
from flask import jsonify, request

from modules import app
from modules.model import User


def validated_token():
    """ Validated Token """
    try:
        auth_header = request.headers.get('Authorization')

        if not auth_header or 'Bearer' not in auth_header:
            return {'message': 'Bad authorization header'}

        split = auth_header.split(' ')

        if not len(split) == 2:
            return {'message': 'Bad authorization header'}

        decode_data = jwt.decode(split[1], app.config['SECRET_KEY'], "HS256")
        user = User.query.filter_by(public_id=decode_data['id']).first()

        if not user:
            return {"message": "User not found"}

        return {'user': user}
    except Exception as error:
        return {"message": str(error)}


def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        res = validated_token()
        if not res.get('user'):
            return jsonify(res.get('message')), 401
        return f(res.get('user'), *args, **kwargs)

    return decorated
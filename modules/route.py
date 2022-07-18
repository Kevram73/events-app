import os
import uuid
from datetime import datetime
from os import abort

from flask import request, jsonify, make_response
from pip._internal.utils.misc import hash_file
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import redirect, secure_filename

from modules import app, db
import jwt

from modules.model import User, Category, Event
from modules.services import token_required


@app.route('/test', methods=['GET'])
def test():
    return "Test route"


# Creation de la ferme
@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    hashed_password = generate_password_hash(data['password'], method='sha256')
    try:
        # Creation de l'utilisateur
        newUser = User(username=data['username'], fullname=data['fullname'], password=hashed_password,
                       email=data['email'], created_at=datetime.now(), updated_at=datetime.now())
        db.session.add(newUser)
        db.session.commit()

        return jsonify({'message': 'Registered successfully'})
    except:
        return jsonify({'message': 'Error on saving'})
    finally:
        return jsonify({'message': 'Code works well'})


# Login Auth
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    user = User.query.filter_by(username=data['username']).first()
    if check_password_hash(user.password, data['password']):
        token = jwt.encode(
            {'id': user.id},
            app.config['SECRET_KEY'], "HS256")

        return jsonify({'token': token, 'user': user})

    return make_response('could not verify', 401, {'Authentication': '"login required"'})


""" CRUD CATEGORY BEGIN """


# Create category

@app.route('/category/create', methods=['POST'])
@token_required
def create_category():
    try:
        data = request.get_json()
        category = Category(name=data['name'], description=data['description'], created_at=datetime.now(),
                            updated_at=datetime.now())
        db.session.add(category)
        db.session.commit()
        return jsonify({'message': "La categorie a bien été créée"})
    except:
        return jsonify({'message': "Une erreur s'est produite"})
    finally:
        return jsonify({'message': 'Le code marche'})


# Category's list
@app.route('/categories', methods=['GET'])
@token_required
def categories():
    list_categories = list()
    categories = Category.query.all()
    for i in categories:
        list_categories.append(i.getDetails)
    return jsonify({'categories': list_categories})


# Category's delete
@app.route('/categorie/delete/<int:id>', methods=['POST'])
@token_required
def delete_category(id):
    category = Category.query.filter_by(id=id).first()
    if request.method == 'POST':
        if category:
            db.session.delete(category)
            db.session.commit()
        abort(404)


# Category's update
@app.route('/categorie/update/<int:id>', methods=['POST'])
@token_required
def update_category(id):
    data = request.get_json()
    categorie = Category.query.filter_by(id=id).first()
    if request.method == 'POST':
        if categorie:
            categorie.name = data['name']
            categorie.description = data['description']
            categorie.updated_at = datetime.now()
            db.session.commit()
            return f"La categorie a bien été mis à jour"
        return f"La categorie n\'existe déjà"


""" CRUD CATEGORY END """

""" CRUD EVENT BEGIN """


# Create event
@app.route('/event/create', methods=['POST'])
@token_required
def create_event():
    data = request.get_json()

    if not os.path.exists(str(os.environ.get('UPLOAD_FOLDER'))):
        # Create directory if not exists
        os.mkdir(os.environ.get('UPLOAD_FOLDER'))
    else:
        # If exist : launch request
        if request.method == 'POST':
            # file getting
            f = request.files['file']
            # Hash content
            filename = secure_filename(f.filename)
            # Upload file
            f.save(os.environ.get('UPLOAD_FOLDER') + filename)
            event = Event(image=filename, name=data['name'], description=data['description'],
                          start_time=data['start_time'], end_time=data['end_time'], shareable=True,
                          category_id=data['category_id'], user_id=data['user_id'], created_at=datetime.now(),
                          updated_at=datetime.now())
            db.session.add(event)
            db.session.commit()


# Event's list
@app.route('/events', methods=['GET'])
@token_required
def events():
    eventList = []
    events = Event.query.all()
    for i in events:
        eventList.append(i.getEvents())
    return jsonify({'events': events})


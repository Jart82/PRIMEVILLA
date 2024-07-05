import json

from flask import render_template, request, redirect, flash, make_response, session, abort, url_for, jsonify
from markupsafe import escape
from flask_wtf.csrf import CSRFError
from sqlalchemy.sql import text
from sqlalchemy import and_, or_, desc
from datetime import datetime

#local import
from pkg import app, csrf, db
from pkg.models import Property, Prop_images, Prop_type, Request




@app.errorhandler(410)
def page_gone(error):
    return render_template('user/errorpage.html', err=error.description), 410

@app.errorhandler(500)
def custom_error(error):
    return render_template('user/errorpage.html', err=error.description), 500

@app.errorhandler(404)
def page_not_found(error):
    return render_template('user/errorpage.html', err=error.description), 404

@app.errorhandler(CSRFError)
def csrf_error_handle(e):
    return render_template('user/errorpage.html', err=e.description), 400

@app.route('/')
def home():
 return render_template("user/index.html")

@app.route("/dashboard/")
def dashboard():
    return render_template("user/dashboard_page.html")

@app.route('/property/', methods = ["GET","POST"])
def property():
    return render_template("user/property.html")


@app.route('/search/', methods = ["GET","POST"])
def search():

    search = request.form.get('search')

    properties = Property.query.filter(Property.property_address.like(f'%{search}%')).all()
    
    result = []
    for prop in properties:
        imgs = []
        for images in prop.myprop_img:
            imgs.append(
                images.image_file
            )
        result.append({
            'id': prop.property_id,
            'price': prop.prop_price,
            'address': prop.property_address,
            'images': imgs
        })
        
      
    return jsonify(result)
    
@app.route('/display/', methods = ["GET","POST"])
def display():
    properties = Property.query.all()
    result = []
    for prop in properties:
        imgs = []
        for images in prop.myprop_img:
            imgs.append(
                images.image_file
            )
        result.append({
            'id': prop.property_id,
            'price': prop.prop_price,
            'address': prop.property_address,
            'images': imgs
        })
        
      
    return jsonify(result)

@app.route('/property/details/<int:id>', methods = ["GET","POST"])
def details(id):
    prop = Property.query.filter(Property.property_id==id).first()
    result = []
    imgs=[]
    for images in prop.myprop_img:
        imgs.append(
            images.image_file
        )
    result = {
        'id': prop.property_id,
        'price': prop.prop_price,
        'address': prop.property_address,
        'images': imgs,
        'rooms': prop.number_of_rooms,
        'bathrooms': prop.number_of_bathrooms
    }
    return render_template('user/prop_detail.html', result= result)


@app.route("/request/", methods = ["GET","POST"])
def request_prop():
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        subject = request.form.get("subject")
        message = request.form.get("message")
        data2send = Request(request_name=name, request_email=email, request_subject=subject, request_content = message)
        db.session.add(data2send)
        db.session.commit()
        flash('Your message has been successfully sent',category='success')
        return redirect("/")
    else:
        return render_template("user/index.html")
    


